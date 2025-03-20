#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/alt_irq.h>
#include <sys/alt_alarm.h>
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "altera_avalon_timer_regs.h"
#include "altera_up_avalon_audio.h"
#include "altera_up_avalon_audio_and_video_config.h"

// Audio buffer size (must be smaller than FIFO size)
#define BUFFER_SIZE 64

// Audio data size in ROM - adjust to match actual ROM size
#define AUDIO_DATA_SIZE (240254 / 2)  // Size in 16-bit samples

// Status LEDs
#define LED_INIT        0x01
#define LED_CONFIG_DONE 0x02
#define LED_PLAYING     0x04
#define LED_PAUSED      0x08
#define LED_ERROR       0x80
#define LED_VOL_CHANGE  0x10
#define LED_MODE_CHANGE 0x20

// Switch functions
#define SW_PLAY_PAUSE   0x01
#define SW_RESTART      0x02
#define SW_LOOP         0x04
#define SW_VOL_UP       0x08
#define SW_VOL_DOWN     0x10
#define SW_LINE_IN      0x20
#define SW_MIC_IN       0x40
#define SW_BYPASS       0x80

// Button functions
#define BTN_RESET       0x01
#define BTN_MUTE        0x02

// Volume settings
#define DEFAULT_HEADPHONE_VOLUME 0x79  // Working volume from original code
#define MIN_HEADPHONE_VOLUME     0x30  // Avoid going too low
#define MAX_HEADPHONE_VOLUME     0x7F
#define VOLUME_STEP              0x04

// Global variables
alt_up_audio_dev *audio_dev = NULL;
alt_up_av_config_dev *av_config = NULL;

// Audio state (volatile because modified in ISR)
volatile int audio_playing = 0;
volatile int audio_position = 0;
volatile int audio_loop = 0;
volatile int buffer_underrun = 0;
volatile unsigned int last_switch_state = 0;
volatile unsigned int last_button_state = 0;
volatile int headphone_volume = DEFAULT_HEADPHONE_VOLUME;
volatile int muted = 0;

// Function prototypes
int initialize_audio(void);
void handle_audio_interrupt(void* context);
void update_leds(int status);
alt_u32 timer_isr(void* context);
void process_audio_buffer(void);
void set_headphone_volume(int volume);
void toggle_mute(void);

// Main function
int main(void) {
    printf("Audio Playback Application Starting\n");

    // Initialize status
    update_leds(LED_INIT);

    // Initialize audio codec
    if (initialize_audio() != 0) {
        printf("Audio initialization failed\n");
        update_leds(LED_ERROR);
        return -1;
    }

    update_leds(LED_CONFIG_DONE);
    printf("Audio configuration successful\n");

    // Setup timer for periodic processing (100ms)
    alt_alarm timer;
    alt_alarm_start(&timer, alt_ticks_per_second()/10, timer_isr, NULL);

    // Fill buffers initially to prevent underrun
    process_audio_buffer();
    audio_playing = 1;
    update_leds(LED_PLAYING);
    printf("Audio playback started\n");

    // Main application loop
    while (1) {
        // Read switch status
        unsigned int switches = IORD_ALTERA_AVALON_PIO_DATA(SWITCH_PIO_BASE);
        unsigned int buttons = IORD_ALTERA_AVALON_PIO_DATA(KEY_PIO_BASE);

        // Invert button values since they are active-low
        buttons = ~buttons & 0xF;

        // Process switches if changed
        if (switches != last_switch_state) {
            int status_led = (audio_playing ? LED_PLAYING : LED_PAUSED);

            // Play/Pause control (SW0)
            if ((switches & SW_PLAY_PAUSE) != (last_switch_state & SW_PLAY_PAUSE)) {
                if (switches & SW_PLAY_PAUSE) {
                    audio_playing = !audio_playing;
                    if (audio_playing) {
                        printf("Audio playback started\n");
                        status_led = LED_PLAYING;
                    } else {
                        printf("Audio playback paused\n");
                        status_led = LED_PAUSED;
                    }
                }
            }

            // Restart control (SW1)
            if ((switches & SW_RESTART) != (last_switch_state & SW_RESTART)) {
                if (switches & SW_RESTART) {
                    audio_position = 0;
                    printf("Audio playback restarted\n");
                }
            }

            // Loop control (SW2)
            if ((switches & SW_LOOP) != (last_switch_state & SW_LOOP)) {
                audio_loop = (switches & SW_LOOP) ? 1 : 0;
                printf("Audio loop %s\n", audio_loop ? "enabled" : "disabled");
            }

            // Volume Up (SW3)
            if ((switches & SW_VOL_UP) != (last_switch_state & SW_VOL_UP)) {
                if (switches & SW_VOL_UP) {
                    if (headphone_volume < MAX_HEADPHONE_VOLUME) {
                        headphone_volume += VOLUME_STEP;
                        if (headphone_volume > MAX_HEADPHONE_VOLUME) {
                            headphone_volume = MAX_HEADPHONE_VOLUME;
                        }
                        set_headphone_volume(headphone_volume);
                        printf("Volume increased to %d%%\n", (headphone_volume * 100) / MAX_HEADPHONE_VOLUME);
                        status_led |= LED_VOL_CHANGE;
                    }
                }
            }

            // Volume Down (SW4)
            if ((switches & SW_VOL_DOWN) != (last_switch_state & SW_VOL_DOWN)) {
                if (switches & SW_VOL_DOWN) {
                    if (headphone_volume > MIN_HEADPHONE_VOLUME) {
                        headphone_volume -= VOLUME_STEP;
                        if (headphone_volume < MIN_HEADPHONE_VOLUME) {
                            headphone_volume = MIN_HEADPHONE_VOLUME;
                        }
                        set_headphone_volume(headphone_volume);
                        printf("Volume decreased to %d%%\n", (headphone_volume * 100) / MAX_HEADPHONE_VOLUME);
                        status_led |= LED_VOL_CHANGE;
                    }
                }
            }

            update_leds(status_led);
            last_switch_state = switches;
        }

        // Process buttons if changed
        if (buttons != last_button_state) {
            // Mute/Unmute (KEY1)
            if ((buttons & BTN_MUTE) && !(last_button_state & BTN_MUTE)) {
                toggle_mute();
                printf("Audio %s\n", muted ? "muted" : "unmuted");
            }

            last_button_state = buttons;
        }

        // Check for buffer underrun
        if (buffer_underrun) {
            printf("Buffer underrun detected, refilling...\n");
            process_audio_buffer();
            buffer_underrun = 0;
        }

        // Sleep to reduce CPU usage
        usleep(10000);
    }

    return 0;
}

// Set headphone output volume
void set_headphone_volume(int volume) {
    // Ensure volume is within valid range
    if (volume < MIN_HEADPHONE_VOLUME || volume > MAX_HEADPHONE_VOLUME) {
        return;
    }

    // Set volume with zero crossing detection enabled (bit 7 set)
    int reg_data = volume | 0x80;  // Enable zero-crossing detection

    // Update both left and right channels
    alt_up_av_config_write_audio_cfg_register(av_config, AUDIO_REG_LEFT_HEADPHONE_OUT, reg_data);
    alt_up_av_config_write_audio_cfg_register(av_config, AUDIO_REG_RIGHT_HEADPHONE_OUT, reg_data);
}

// Toggle mute state
void toggle_mute(void) {
    muted = !muted;

    // Update DAC mute bit in digital path control register
    int reg_data = muted ? 0x08 : 0x00;  // Bit 3 is DAC mute
    alt_up_av_config_write_audio_cfg_register(av_config, AUDIO_REG_DIGITAL_AUDIO_PATH_CTRL, reg_data);
}

// Initialize audio codec via I2C - EXACTLY matching the working implementation
int initialize_audio(void) {
    // Open audio device
    audio_dev = alt_up_audio_open_dev(AUDIO_NAME);
    if (audio_dev == NULL) {
        printf("Error: could not open audio device\n");
        return -1;
    }

    // Open audio config device
    av_config = alt_up_av_config_open_dev(AUDIO_CONFIG_NAME);
    if (av_config == NULL) {
        printf("Error: could not open audio config device\n");
        return -1;
    }

    // Wait for audio config to complete
    int timeout = 10000;  // Prevent infinite loop
    while (!alt_up_av_config_read_ready(av_config)) {
        if (--timeout <= 0) {
            printf("Error: Audio config device not ready\n");
            return -1;
        }
        usleep(1000);
    }

    // Clear audio FIFOs
    alt_up_audio_reset_audio_core(audio_dev);

    // Configure each WM8731 register using the provided HAL functions - EXACTLY AS IN WORKING CODE
    int config_success = 1;
    config_success &= (alt_up_av_config_write_audio_cfg_register(av_config, AUDIO_REG_LEFT_LINE_IN, 0x17) == 0);
    config_success &= (alt_up_av_config_write_audio_cfg_register(av_config, AUDIO_REG_RIGHT_LINE_IN, 0x17) == 0);
    config_success &= (alt_up_av_config_write_audio_cfg_register(av_config, AUDIO_REG_LEFT_HEADPHONE_OUT, 0x79) == 0);
    config_success &= (alt_up_av_config_write_audio_cfg_register(av_config, AUDIO_REG_RIGHT_HEADPHONE_OUT, 0x79) == 0);
    config_success &= (alt_up_av_config_write_audio_cfg_register(av_config, AUDIO_REG_ANALOG_AUDIO_PATH_CTRL, 0x10) == 0);
    config_success &= (alt_up_av_config_write_audio_cfg_register(av_config, AUDIO_REG_DIGITAL_AUDIO_PATH_CTRL, 0x00) == 0);
    config_success &= (alt_up_av_config_write_audio_cfg_register(av_config, AUDIO_REG_POWER_DOWN_CTRL, 0x00) == 0);
    config_success &= (alt_up_av_config_write_audio_cfg_register(av_config, AUDIO_REG_AUDIO_DIGITAL_INTERFACE, 0x42) == 0);
    config_success &= (alt_up_av_config_write_audio_cfg_register(av_config, AUDIO_REG_SAMPLING_CTRL, 0x00) == 0);
    config_success &= (alt_up_av_config_write_audio_cfg_register(av_config, AUDIO_REG_ACTIVE_CTRL, 0x01) == 0);

    if (!config_success) {
        printf("Error: Failed to configure audio codec\n");
        return -1;
    }

    // Enable audio write interrupt
    alt_up_audio_enable_write_interrupt(audio_dev);

    headphone_volume = DEFAULT_HEADPHONE_VOLUME;
    muted = 0;

    return 0;
}

// Process and fill audio buffer - copied exactly from working version
void process_audio_buffer(void) {
    // Only process if we're playing audio
    if (!audio_playing) return;

    // Check available space in output FIFO
    unsigned int space_left = alt_up_audio_write_fifo_space(audio_dev, ALT_UP_AUDIO_LEFT);
    unsigned int space_right = alt_up_audio_write_fifo_space(audio_dev, ALT_UP_AUDIO_RIGHT);
    unsigned int space = (space_left < space_right) ? space_left : space_right;

    // Don't process if not enough space
    if (space < BUFFER_SIZE) return;

    // Buffers for audio data
    unsigned int left_buffer[BUFFER_SIZE];
    unsigned int right_buffer[BUFFER_SIZE];

    // Process only if we haven't reached the end of audio data
    if (audio_position < AUDIO_DATA_SIZE || audio_loop) {
        // Read audio data from ROM
        int16_t* audio_data = (int16_t*)AUDIO_ROM_BASE;

        for (int i = 0; i < BUFFER_SIZE; i++) {
            if (audio_position >= AUDIO_DATA_SIZE) {
                if (audio_loop) {
                    // Loop back to beginning
                    printf("Looping audio playback\n");
                    audio_position = 0;
                } else {
                    // Stop playback at end
                    audio_playing = 0;
                    update_leds(LED_PAUSED);
                    printf("End of audio reached\n");
                    return;
                }
            }

            // Bounds check
            if (audio_position < 0 || audio_position >= AUDIO_DATA_SIZE) {
                printf("Error: Audio position out of bounds: %d\n", audio_position);
                audio_position = 0;
            }

            // Read audio sample from ROM (memory-mapped)
            int16_t sample = audio_data[audio_position];

            // Convert to unsigned int for audio FIFO
            // Same sample for both left and right channels (mono output)
            left_buffer[i] = (unsigned int)sample;
            right_buffer[i] = (unsigned int)sample;

            audio_position++;
        }

        // Write audio data to codec
        int written_left = alt_up_audio_write_fifo(audio_dev, left_buffer, BUFFER_SIZE, ALT_UP_AUDIO_LEFT);
        int written_right = alt_up_audio_write_fifo(audio_dev, right_buffer, BUFFER_SIZE, ALT_UP_AUDIO_RIGHT);

        // Check if write was successful
        if (written_left != BUFFER_SIZE || written_right != BUFFER_SIZE) {
            printf("Warning: Not all audio samples written (%d, %d)\n", written_left, written_right);
        }
    }
}

// Audio interrupt handler
void handle_audio_interrupt(void* context) {
    // Check which type of interrupt occurred
    int write_pending = alt_up_audio_write_interrupt_pending(audio_dev);

    // If write interrupt (FIFO has space), fill the buffer
    if (write_pending) {
        // Clear the interrupt by handling it
        alt_up_audio_disable_write_interrupt(audio_dev);

        // Signal buffer underrun
        buffer_underrun = 1;

        // Re-enable interrupt after handling
        alt_up_audio_enable_write_interrupt(audio_dev);
    }
}

// Timer ISR - called periodically to ensure audio buffer is filled
alt_u32 timer_isr(void* context) {
    process_audio_buffer();

    // Return time until next timer interrupt (continue with same period)
    return alt_ticks_per_second()/10;
}

// Update LED status
void update_leds(int status) {
    IOWR_ALTERA_AVALON_PIO_DATA(LED_PIO_BASE, status);
}
