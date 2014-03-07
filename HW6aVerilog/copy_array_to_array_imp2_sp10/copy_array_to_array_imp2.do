
# copy_array_to_array_imp2.do

vlib work
vlog +acc  "copy_array_to_array_imp2.v"
vlog +acc  "copy_array_to_array_imp2_tb.v"
vsim -t 1ps -lib work copy_array_to_array_imp2_tb
do {copy_array_to_array_imp2_wave.do}
view wave
view structure
view signals
log -r *
run 2us
WaveRestoreZoom {0 ps} {1800000 ps}