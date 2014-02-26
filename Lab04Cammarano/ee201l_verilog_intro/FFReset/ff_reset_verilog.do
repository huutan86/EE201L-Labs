
# ff_reset_verilog.do

vlib work
vlog +acc  "ff_reset_verilog.v"
vlog +acc  "ff_reset_verilog_tb.v"
# vsim  work.ff_reset_tb
vsim -novopt -t 1ps -lib work ff_reset_tb
do {ff_reset_verilog_wave.do}
view wave
view structure
view signals
log -r *
run 600ns
WaveRestoreZoom {80 ns} {600 ns}