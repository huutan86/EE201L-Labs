onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ff_reset_tb/D_tb
add wave -noupdate /ff_reset_tb/Clk_tb
add wave -noupdate /ff_reset_tb/Reset_b_tb
add wave -noupdate /ff_reset_tb/De_tb
add wave -noupdate /ff_reset_tb/Q_bad_r_tb
add wave -noupdate /ff_reset_tb/Q_async_r_tb
add wave -noupdate /ff_reset_tb/Q_sync_r_tb
add wave -noupdate /ff_reset_tb/Q_no_r_tb
add wave -noupdate /ff_reset_tb/Q_async_r_de_tb
add wave -noupdate /ff_reset_tb/Q_sync_r_de_tb
add wave -noupdate /ff_reset_tb/Q_no_r_de_tb
add wave -noupdate /ff_reset_tb/Clk_cnt
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
WaveRestoreZoom {0 ps} {610300 ps}
