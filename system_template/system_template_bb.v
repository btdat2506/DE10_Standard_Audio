
module system_template (
	clk_clk,
	pio_0_external_connection_export,
	pio_1_external_connection_export,
	reset_reset_n);	

	input		clk_clk;
	output	[31:0]	pio_0_external_connection_export;
	input	[31:0]	pio_1_external_connection_export;
	input		reset_reset_n;
endmodule
