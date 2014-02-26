library verilog;
use verilog.vl_types.all;
entity ff_reset is
    port(
        D               : in     vl_logic;
        Clk             : in     vl_logic;
        Reset_b         : in     vl_logic;
        de              : in     vl_logic;
        Q_bad_r         : out    vl_logic;
        Q_async_r       : out    vl_logic;
        Q_sync_r        : out    vl_logic;
        Q_no_r          : out    vl_logic;
        Q_async_r_de    : out    vl_logic;
        Q_sync_r_de     : out    vl_logic;
        Q_no_r_de       : out    vl_logic
    );
end ff_reset;
