vlib work
vlog +acc "ee201_GCD.v"
vlog +acc "ee201_GCD_tb_part2.v"

vsim -t 1ps -lib work ee201_GCD_tb_part1
view objects
view wave


onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ee201_GCD_tb_part1/Clk
add wave -noupdate /ee201_GCD_tb_part1/CEN
add wave -noupdate /ee201_GCD_tb_part1/Reset
add wave -noupdate /ee201_GCD_tb_part1/Start
add wave -noupdate /ee201_GCD_tb_part1/Ack
add wave -noupdate /ee201_GCD_tb_part1/Ain
add wave -noupdate /ee201_GCD_tb_part1/Bin
add wave -noupdate /ee201_GCD_tb_part1/A
add wave -noupdate /ee201_GCD_tb_part1/B
add wave -noupdate /ee201_GCD_tb_part1/AB_GCD
add wave -noupdate /ee201_GCD_tb_part1/i_count
add wave -noupdate /ee201_GCD_tb_part1/q_I
add wave -noupdate /ee201_GCD_tb_part1/q_Sub
add wave -noupdate /ee201_GCD_tb_part1/q_Mult
add wave -noupdate /ee201_GCD_tb_part1/q_Done
add wave -noupdate /ee201_GCD_tb_part1/state_string
add wave -noupdate /ee201_GCD_tb_part1/test_number
add wave -noupdate /ee201_GCD_tb_part1/Clk_cnt
add wave -noupdate /ee201_GCD_tb_part1/Start_clock_count
add wave -noupdate /ee201_GCD_tb_part1/Clocks_taken
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update

log -r *
run 1500ns

WaveRestoreZoom {0 ps} {735 ns}
