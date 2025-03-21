module DE10_Standard_Audio (
    // Clock and reset
    input              CLOCK_50,
    input              RESET_N,
    
    // LEDs and switches
    output     [9:0]   LEDR,
    input      [9:0]   SW,
    input      [3:0]   KEY,
    
    // Audio interface
    //output             AUD_XCK,     // Master clock to codec
    inout              AUD_BCLK,    // Bit clock
    inout              AUD_ADCLRCK, // ADC LR clock
    input              AUD_ADCDAT,  // ADC data
    inout              AUD_DACLRCK, // DAC LR clock
    output             AUD_DACDAT,  // DAC data
    
    // I2C for audio config
    inout              FPGA_I2C_SDAT,  // I2C data
    output             FPGA_I2C_SCLK   // I2C clock
);

    // Internal wires for Qsys system
    wire system_reset;
    assign system_reset = KEY[0];
    
    // Instantiate the Qsys system
    audio_system u0 (
        .clk_clk                           (CLOCK_50),
        .reset_reset_n                     (system_reset),
        
        // Audio interface connections
        .audio_interface_ADCDAT            (AUD_ADCDAT),
        .audio_interface_ADCLRCK           (AUD_ADCLRCK),
        .audio_interface_BCLK              (AUD_BCLK),
        .audio_interface_DACDAT            (AUD_DACDAT),
        .audio_interface_DACLRCK           (AUD_DACLRCK),
        //.audio_pll_0_audio_clk_clk         (AUD_XCK),
        
        // I2C for audio configuration
        .audio_config_i2c_SDAT             (FPGA_I2C_SDAT),
        .audio_config_i2c_SCLK             (FPGA_I2C_SCLK),
        
        // User interface connections
        .led_external_export               (LEDR),
        .switch_external_export            (SW),
        .key_external_export               (~KEY)  // KEYs are active low
    );

endmodule