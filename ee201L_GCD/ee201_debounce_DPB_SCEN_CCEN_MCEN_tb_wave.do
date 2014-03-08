onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ee201_debounce_DPB_SCEN_CCEN_MCEN_tb/Clk_tb
add wave -noupdate /ee201_debounce_DPB_SCEN_CCEN_MCEN_tb/Reset_tb
add wave -noupdate /ee201_debounce_DPB_SCEN_CCEN_MCEN_tb/PB_tb
add wave -noupdate -radix binary /ee201_debounce_DPB_SCEN_CCEN_MCEN_tb/DPB_tb
add wave -noupdate -radix binary /ee201_debounce_DPB_SCEN_CCEN_MCEN_tb/SCEN_tb
add wave -noupdate -radix binary /ee201_debounce_DPB_SCEN_CCEN_MCEN_tb/MCEN_tb
add wave -noupdate -radix binary /ee201_debounce_DPB_SCEN_CCEN_MCEN_tb/CCEN_tb
add wave -noupdate -radix unsigned /ee201_debounce_DPB_SCEN_CCEN_MCEN_tb/DUT/debounce_count
add wave -noupdate -radix unsigned /ee201_debounce_DPB_SCEN_CCEN_MCEN_tb/DUT/MCEN_count
add wave -noupdate -radix ascii /ee201_debounce_DPB_SCEN_CCEN_MCEN_tb/state_string
add wave -noupdate /ee201_debounce_DPB_SCEN_CCEN_MCEN_tb/Clk_cnt
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3870000 ps} 0}
configure wave -namecolwidth 150
configure wave -valuecolwidth 69
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
WaveRestoreZoom {0 ps} {15885671 ps}
