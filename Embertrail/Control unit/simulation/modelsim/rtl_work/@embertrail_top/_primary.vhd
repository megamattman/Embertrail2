library verilog;
use verilog.vl_types.all;
entity Embertrail_top is
    port(
        iClock          : in     vl_logic;
        iPC             : in     vl_logic_vector(31 downto 0);
        iIR             : in     vl_logic_vector(31 downto 0)
    );
end Embertrail_top;
