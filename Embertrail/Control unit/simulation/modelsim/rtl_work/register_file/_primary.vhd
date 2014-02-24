library verilog;
use verilog.vl_types.all;
entity register_file is
    port(
        iClock          : in     vl_logic;
        iReadPort1A     : in     vl_logic;
        iReadPort1B     : in     vl_logic;
        iReadPort2A     : in     vl_logic;
        iReadPort2B     : in     vl_logic;
        iWritePort1     : in     vl_logic;
        iWritePort2     : in     vl_logic;
        iRegReadSel1A   : in     vl_logic_vector(4 downto 0);
        iRegReadSel1B   : in     vl_logic_vector(4 downto 0);
        iRegReadSel2A   : in     vl_logic_vector(4 downto 0);
        iRegReadSel2B   : in     vl_logic_vector(4 downto 0);
        oRead1AData     : out    vl_logic_vector(15 downto 0);
        oRead1BData     : out    vl_logic_vector(15 downto 0);
        oRead2AData     : out    vl_logic_vector(15 downto 0);
        oRead2BData     : out    vl_logic_vector(15 downto 0);
        iRegWrite1      : in     vl_logic_vector(20 downto 0);
        iRegWrite2      : in     vl_logic_vector(20 downto 0)
    );
end register_file;
