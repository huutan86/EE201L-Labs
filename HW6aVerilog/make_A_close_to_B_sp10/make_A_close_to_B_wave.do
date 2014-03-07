onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Literal -radix unsigned /make_A_close_to_B_tb/Ain_tb
add wave -noupdate -format Literal -radix unsigned /make_A_close_to_B_tb/Bin_tb
add wave -noupdate -format Literal -radix unsigned /make_A_close_to_B_tb/A_tb
add wave -noupdate -format Logic /make_A_close_to_B_tb/Start_tb
add wave -noupdate -format Logic /make_A_close_to_B_tb/Ack_tb
add wave -noupdate -format Logic /make_A_close_to_B_tb/Clk_tb
add wave -noupdate -format Logic /make_A_close_to_B_tb/Reset_tb
add wave -noupdate -format Logic /make_A_close_to_B_tb/Flag_tb
add wave -noupdate -format Logic /make_A_close_to_B_tb/Qi_tb
add wave -noupdate -format Logic /make_A_close_to_B_tb/Qc_tb
add wave -noupdate -format Logic /make_A_close_to_B_tb/Qd_tb
add wave -noupdate -format Literal -radix ascii /make_A_close_to_B_tb/state_string
add wave -noupdate -format Literal /make_A_close_to_B_tb/Clk_cnt
add wave -noupdate -format Literal -radix unsigned /make_A_close_to_B_tb/test_number
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {775792 ps} 0}
configure wave -namecolwidth 150
configure wave -valuecolwidth 61
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {935550 ps}
