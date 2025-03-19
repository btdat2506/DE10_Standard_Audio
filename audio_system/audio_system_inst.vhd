	component audio_system is
		port (
			audio_config_i2c_SDAT   : inout std_logic                     := 'X';             -- SDAT
			audio_config_i2c_SCLK   : out   std_logic;                                        -- SCLK
			audio_interface_ADCDAT  : in    std_logic                     := 'X';             -- ADCDAT
			audio_interface_ADCLRCK : in    std_logic                     := 'X';             -- ADCLRCK
			audio_interface_BCLK    : in    std_logic                     := 'X';             -- BCLK
			audio_interface_DACDAT  : out   std_logic;                                        -- DACDAT
			audio_interface_DACLRCK : in    std_logic                     := 'X';             -- DACLRCK
			clk_clk                 : in    std_logic                     := 'X';             -- clk
			key_external_export     : in    std_logic_vector(31 downto 0) := (others => 'X'); -- export
			led_external_export     : out   std_logic_vector(31 downto 0);                    -- export
			reset_reset_n           : in    std_logic                     := 'X';             -- reset_n
			switch_external_export  : in    std_logic_vector(31 downto 0) := (others => 'X')  -- export
		);
	end component audio_system;

	u0 : component audio_system
		port map (
			audio_config_i2c_SDAT   => CONNECTED_TO_audio_config_i2c_SDAT,   -- audio_config_i2c.SDAT
			audio_config_i2c_SCLK   => CONNECTED_TO_audio_config_i2c_SCLK,   --                 .SCLK
			audio_interface_ADCDAT  => CONNECTED_TO_audio_interface_ADCDAT,  --  audio_interface.ADCDAT
			audio_interface_ADCLRCK => CONNECTED_TO_audio_interface_ADCLRCK, --                 .ADCLRCK
			audio_interface_BCLK    => CONNECTED_TO_audio_interface_BCLK,    --                 .BCLK
			audio_interface_DACDAT  => CONNECTED_TO_audio_interface_DACDAT,  --                 .DACDAT
			audio_interface_DACLRCK => CONNECTED_TO_audio_interface_DACLRCK, --                 .DACLRCK
			clk_clk                 => CONNECTED_TO_clk_clk,                 --              clk.clk
			key_external_export     => CONNECTED_TO_key_external_export,     --     key_external.export
			led_external_export     => CONNECTED_TO_led_external_export,     --     led_external.export
			reset_reset_n           => CONNECTED_TO_reset_reset_n,           --            reset.reset_n
			switch_external_export  => CONNECTED_TO_switch_external_export   --  switch_external.export
		);

