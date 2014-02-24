library verilog;
use verilog.vl_types.all;
entity alu is
    port(
        iClock          : in     vl_logic;
        iOperandA       : in     vl_logic_vector(15 downto 0);
        iOperandB       : in     vl_logic_vector(15 downto 0);
        iOperation      : in     vl_logic_vector(4 downto 0);
        oAluResult      : out    vl_logic_vector(15 downto 0)
    );
end alu;
