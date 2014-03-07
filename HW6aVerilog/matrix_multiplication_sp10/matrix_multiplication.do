
# matrix_multiplication.do

vlib work
vlog +acc  "matrix_multiplication.v"
vlog +acc  "matrix_multiplication_tb.v"
vsim -t 1ps -lib work matrix_multiplication_tb
do {matrix_multiplication_wave.do}
view wave
view structure
view signals
log -r *
run 1500ns
WaveRestoreZoom {0 ps} {1400000 ps}