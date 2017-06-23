library verilog;
use verilog.vl_types.all;
entity TopDE_vlg_sample_tst is
    port(
        AUD_ADCLRCK     : in     vl_logic;
        AUD_BCLK        : in     vl_logic;
        I2C_SDAT        : in     vl_logic;
        LCD_D           : in     vl_logic_vector(7 downto 0);
        PS2_KBCLK       : in     vl_logic;
        PS2_KBDAT       : in     vl_logic;
        SD_CMD          : in     vl_logic;
        SD_DAT          : in     vl_logic;
        SD_DAT3         : in     vl_logic;
        SRAM_DQ         : in     vl_logic_vector(31 downto 0);
        iAUD_ADCDAT     : in     vl_logic;
        iCLK_28         : in     vl_logic;
        iCLK_50         : in     vl_logic;
        iCLK_50_2       : in     vl_logic;
        iCLK_50_4       : in     vl_logic;
        iIRDA_RXD       : in     vl_logic;
        iKEY            : in     vl_logic_vector(3 downto 0);
        iSW             : in     vl_logic_vector(17 downto 0);
        iUART_RTS       : in     vl_logic;
        iUART_RXD       : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end TopDE_vlg_sample_tst;
