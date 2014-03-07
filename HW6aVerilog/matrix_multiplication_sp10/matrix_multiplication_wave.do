onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Literal /matrix_multiplication_tb/Clk_cnt
add wave -noupdate -format Literal /matrix_multiplication_tb/Clocks_taken
add wave -noupdate -format Literal /matrix_multiplication_tb/Start_clock_count
add wave -noupdate -format Logic /matrix_multiplication_tb/UUT/clk
add wave -noupdate -format Logic /matrix_multiplication_tb/UUT/reset
add wave -noupdate -format Logic /matrix_multiplication_tb/UUT/start
add wave -noupdate -format Logic /matrix_multiplication_tb/UUT/ack
add wave -noupdate -format Logic /matrix_multiplication_tb/UUT/done
add wave -noupdate -format Logic -radix unsigned /matrix_multiplication_tb/UUT/i
add wave -noupdate -format Literal -radix unsigned /matrix_multiplication_tb/UUT/k
add wave -noupdate -format Literal -radix unsigned /matrix_multiplication_tb/UUT/j
add wave -noupdate -format Literal -radix ascii /matrix_multiplication_tb/state_string
add wave -noupdate -format Literal /matrix_multiplication_tb/UUT/state
add wave -noupdate -format Logic /matrix_multiplication_tb/UUT/q_init
add wave -noupdate -format Logic /matrix_multiplication_tb/UUT/q_compute
add wave -noupdate -format Logic /matrix_multiplication_tb/UUT/q_done
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
configure wave -namecolwidth 150
configure wave -valuecolwidth 59
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1000
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {1500000 ps}
