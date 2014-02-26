
# divider.do

vlib work
vlog +acc  "divider_separate_cu_dpu.v"
vlog +acc  "divider_tb_str.v"
# vsim  work.divider_tb
vsim -novopt -t 1ps -lib work divider_tb
run 700ns
