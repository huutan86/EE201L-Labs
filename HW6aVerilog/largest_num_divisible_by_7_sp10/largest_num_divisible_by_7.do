
# largest_num_divisible_by_7.do

vlib work
vlog +acc  "largest_num_divisible_by_7.v"
vlog +acc  "largest_num_divisible_by_7_tb.v"
vsim -t 1ps -lib work largest_num_divisible_by_7_tb
do {largest_num_divisible_by_7_wave.do}
view wave
view structure
view signals
log -r *
run 14us
WaveRestoreZoom {0 ps} {14000000 ps}
run 4us