
# copy_array_to_array_imp1.do

vlib work
vlog +acc  "copy_array_to_array_imp1.v"
vlog +acc  "copy_array_to_array_imp1_tb.v"
vsim -t 1ps -lib work copy_array_to_array_imp1_tb
do {copy_array_to_array_imp1_wave.do}
view wave
view structure
view signals
log -r *
run 2us
WaveRestoreZoom {0 ps} {1800000 ps}