
module audio_system (
	audio_config_i2c_SDAT,
	audio_config_i2c_SCLK,
	audio_interface_ADCDAT,
	audio_interface_ADCLRCK,
	audio_interface_BCLK,
	audio_interface_DACDAT,
	audio_interface_DACLRCK,
	clk_clk,
	key_external_export,
	led_external_export,
	reset_reset_n,
	switch_external_export);	

	inout		audio_config_i2c_SDAT;
	output		audio_config_i2c_SCLK;
	input		audio_interface_ADCDAT;
	input		audio_interface_ADCLRCK;
	input		audio_interface_BCLK;
	output		audio_interface_DACDAT;
	input		audio_interface_DACLRCK;
	input		clk_clk;
	input	[31:0]	key_external_export;
	output	[31:0]	led_external_export;
	input		reset_reset_n;
	input	[31:0]	switch_external_export;
endmodule
