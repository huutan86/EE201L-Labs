onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /divider_tb/divider_1/Clk
add wave -noupdate /divider_tb/divider_1/Reset
add wave -noupdate -radix unsigned /divider_tb/divider_1/Xin
add wave -noupdate -radix unsigned /divider_tb/divider_1/Yin
add wave -noupdate -radix unsigned /divider_tb/divider_1/x
add wave -noupdate -radix unsigned /divider_tb/divider_1/y
add wave -noupdate -radix unsigned /divider_tb/divider_1/Quotient
add wave -noupdate -radix unsigned /divider_tb/divider_1/Remainder
add wave -noupdate /divider_tb/divider_1/state
add wave -noupdate /divider_tb/divider_1/Start
add wave -noupdate /divider_tb/divider_1/Done
add wave -noupdate /divider_tb/divider_1/Ack
add wave -noupdate /divider_tb/Clk_cnt
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0} {{Cursor 2} {265000 ps} 0} {{Cursor 3} {425000 ps} 0}
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
configure wave -timelineunits ps
update
WaveRestoreZoom {173 ns} {488200 ps}
