onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /copy_array_to_array_imp1_tb/Reset
add wave -noupdate -format Logic /copy_array_to_array_imp1_tb/Clk
add wave -noupdate -format Logic /copy_array_to_array_imp1_tb/Start
add wave -noupdate -format Logic /copy_array_to_array_imp1_tb/Ack
add wave -noupdate -format Literal -radix unsigned /copy_array_to_array_imp1_tb/Ms_of_I
add wave -noupdate -format Literal -radix decimal /copy_array_to_array_imp1_tb/Ms_of_I
add wave -noupdate -format Logic /copy_array_to_array_imp1_tb/Ns_of_J_Write
add wave -noupdate -format Literal -radix unsigned /copy_array_to_array_imp1_tb/I
add wave -noupdate -format Literal -radix unsigned /copy_array_to_array_imp1_tb/J
add wave -noupdate -format Literal /copy_array_to_array_imp1_tb/UUT/state
add wave -noupdate -format Literal -radix ascii /copy_array_to_array_imp1_tb/state_string
add wave -noupdate -format Literal /copy_array_to_array_imp1_tb/Clk_cnt
add wave -noupdate -format Literal /copy_array_to_array_imp1_tb/Start_clock_count
add wave -noupdate -format Literal /copy_array_to_array_imp1_tb/Clocks_taken
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ps} {1800000 ps}
