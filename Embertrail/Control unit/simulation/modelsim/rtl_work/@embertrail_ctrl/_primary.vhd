library verilog;
use verilog.vl_types.all;
entity Embertrail_ctrl is
    port(
        iClock          : in     vl_logic;
        iIR             : in     vl_logic_vector(31 downto 0);
        iPC             : in     vl_logic_vector(15 downto 0);
        iMemoryReadData1: in     vl_logic_vector(15 downto 0);
        iMemoryReadData2: in     vl_logic_vector(15 downto 0);
        oMemoryWriteData1: out    vl_logic_vector(15 downto 0);
        oMemoryWriteData2: out    vl_logic_vector(15 downto 0);
        oMemoryWriteAddress1: out    vl_logic_vector(15 downto 0);
        oMemoryWriteAddress2: out    vl_logic_vector(15 downto 0);
        oMemoryWrite1   : out    vl_logic;
        oMemoryWrite2   : out    vl_logic;
        oMemoryRead1    : out    vl_logic;
        oMemoryRead2    : out    vl_logic;
        oNPC            : out    vl_logic_vector(15 downto 0)
    );
end Embertrail_ctrl;
