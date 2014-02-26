library verilog;
use verilog.vl_types.all;
entity divider is
    port(
        Xin             : in     vl_logic_vector(3 downto 0);
        Yin             : in     vl_logic_vector(3 downto 0);
        Start           : in     vl_logic;
        Ack             : in     vl_logic;
        Clk             : in     vl_logic;
        Reset           : in     vl_logic;
        Done            : out    vl_logic;
        Quotient        : out    vl_logic_vector(3 downto 0);
        Remainder       : out    vl_logic_vector(3 downto 0);
        Qi              : out    vl_logic;
        Qc              : out    vl_logic;
        Qd              : out    vl_logic
    );
end divider;
