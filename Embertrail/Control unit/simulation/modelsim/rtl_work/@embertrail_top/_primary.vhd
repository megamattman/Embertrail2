library verilog;
use verilog.vl_types.all;
entity Embertrail_top is
    port(
        iClock          : in     vl_logic;
        iPC             : in     vl_logic_vector(15 downto 0);
        iIR             : in     vl_logic_vector(31 downto 0);
        iReset          : in     vl_logic;
        iDataDataBus    : in     vl_logic_vector(31 downto 0);
        oDataAddrBus    : out    vl_logic_vector(31 downto 0);
        oInstAddrBus    : out    vl_logic_vector(15 downto 0);
        oDataMem1RW     : out    vl_logic;
        oDataMem2RW     : out    vl_logic;
        oData1BusEn     : out    vl_logic;
        oData2BusEn     : out    vl_logic
    );
end Embertrail_top;
