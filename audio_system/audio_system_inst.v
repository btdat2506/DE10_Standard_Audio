	audio_system u0 (
		.audio_config_i2c_SDAT   (<connected-to-audio_config_i2c_SDAT>),   // audio_config_i2c.SDAT
		.audio_config_i2c_SCLK   (<connected-to-audio_config_i2c_SCLK>),   //                 .SCLK
		.audio_interface_ADCDAT  (<connected-to-audio_interface_ADCDAT>),  //  audio_interface.ADCDAT
		.audio_interface_ADCLRCK (<connected-to-audio_interface_ADCLRCK>), //                 .ADCLRCK
		.audio_interface_BCLK    (<connected-to-audio_interface_BCLK>),    //                 .BCLK
		.audio_interface_DACDAT  (<connected-to-audio_interface_DACDAT>),  //                 .DACDAT
		.audio_interface_DACLRCK (<connected-to-audio_interface_DACLRCK>), //                 .DACLRCK
		.clk_clk                 (<connected-to-clk_clk>),                 //              clk.clk
		.key_external_export     (<connected-to-key_external_export>),     //     key_external.export
		.led_external_export     (<connected-to-led_external_export>),     //     led_external.export
		.reset_reset_n           (<connected-to-reset_reset_n>),           //            reset.reset_n
		.switch_external_export  (<connected-to-switch_external_export>)   //  switch_external.export
	);

