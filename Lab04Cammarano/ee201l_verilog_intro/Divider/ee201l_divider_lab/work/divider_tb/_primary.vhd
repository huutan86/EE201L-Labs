library verilog;
use verilog.vl_types.all;
entity divider_tb is
    generic(
        HALF_PERIOD     : integer := 20
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of HALF_PERIOD : constant is 1;
end divider_tb;
