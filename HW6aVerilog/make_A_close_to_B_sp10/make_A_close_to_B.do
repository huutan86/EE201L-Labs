
# make_A_close_to_B.do

vlib work
vlog +acc  "make_A_close_to_B.v"
vlog +acc  "make_A_close_to_B_tb.v"
vsim -t 1ps -lib work make_A_close_to_B_tb
do {make_A_close_to_B_wave.do}
view wave
view structure
view signals
log -r *
run 2us
WaveRestoreZoom {0 ps} {1000000 ps}