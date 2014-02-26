library verilog;
use verilog.vl_types.all;
entity ff_reset_tb is
    generic(
        Clk_period      : integer := 30
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Clk_period : constant is 1;
end ff_reset_tb;
