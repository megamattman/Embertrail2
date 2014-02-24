onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /Embertrail_ctrl_vlg_tst/clock
add wave -noupdate /Embertrail_ctrl_vlg_tst/IR
add wave -noupdate /Embertrail_ctrl_vlg_tst/i1/i1/inst1Op
add wave -noupdate /Embertrail_ctrl_vlg_tst/i1/i1/inst2Op
add wave -noupdate /Embertrail_ctrl_vlg_tst/i1/i1/inst1BImm
add wave -noupdate /Embertrail_ctrl_vlg_tst/i1/i1/dualInst
add wave -noupdate /Embertrail_ctrl_vlg_tst/i1/i1/inst1RegWB
add wave -noupdate /Embertrail_ctrl_vlg_tst/i1/i1/NPCOut
add wave -noupdate /Embertrail_ctrl_vlg_tst/i1/i1/RF/iReadPort1A
add wave -noupdate /Embertrail_ctrl_vlg_tst/i1/i1/RF/iReadPort1B
add wave -noupdate /Embertrail_ctrl_vlg_tst/i1/i1/RF/iReadPort2A
add wave -noupdate /Embertrail_ctrl_vlg_tst/i1/i1/RF/iReadPort2B
add wave -noupdate /Embertrail_ctrl_vlg_tst/i1/i1/RF/iWritePort1
add wave -noupdate /Embertrail_ctrl_vlg_tst/i1/i1/RF/iWritePort2
add wave -noupdate /Embertrail_ctrl_vlg_tst/i1/i1/RF/iRegReadSel1A
add wave -noupdate /Embertrail_ctrl_vlg_tst/i1/i1/RF/iRegReadSel1B
add wave -noupdate /Embertrail_ctrl_vlg_tst/i1/i1/RF/iRegReadSel2A
add wave -noupdate /Embertrail_ctrl_vlg_tst/i1/i1/RF/iRegReadSel2B
add wave -noupdate /Embertrail_ctrl_vlg_tst/i1/i1/RF/iRegWrite1
add wave -noupdate /Embertrail_ctrl_vlg_tst/i1/i1/RF/iRegWrite2
add wave -noupdate /Embertrail_ctrl_vlg_tst/i1/i1/RF/readData1A_o
add wave -noupdate /Embertrail_ctrl_vlg_tst/i1/i1/RF/readData1B_o
add wave -noupdate /Embertrail_ctrl_vlg_tst/i1/i1/RF/readData2A_o
add wave -noupdate /Embertrail_ctrl_vlg_tst/i1/i1/RF/readData2B_o
add wave -noupdate /Embertrail_ctrl_vlg_tst/i1/i1/alu1Op
add wave -noupdate /Embertrail_ctrl_vlg_tst/i1/i1/alu1OpA
add wave -noupdate /Embertrail_ctrl_vlg_tst/i1/i1/alu1OpB
add wave -noupdate /Embertrail_ctrl_vlg_tst/i1/i1/alu1Result
add wave -noupdate /Embertrail_ctrl_vlg_tst/i1/i1/alu2Op
add wave -noupdate /Embertrail_ctrl_vlg_tst/i1/i1/alu2OpA
add wave -noupdate /Embertrail_ctrl_vlg_tst/i1/i1/alu2OpB
add wave -noupdate /Embertrail_ctrl_vlg_tst/i1/i1/alu2Result
add wave -noupdate /Embertrail_ctrl_vlg_tst/i1/i1/branchOpA
add wave -noupdate /Embertrail_ctrl_vlg_tst/i1/i1/branchOpB
add wave -noupdate /Embertrail_ctrl_vlg_tst/i1/i1/branchTaken
add wave -noupdate -expand /Embertrail_ctrl_vlg_tst/i1/i1/RF/r_d
add wave -noupdate -radix unsigned -childformat {{{/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[31]} -radix unsigned} {{/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[30]} -radix unsigned} {{/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[29]} -radix unsigned} {{/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[28]} -radix unsigned} {{/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[27]} -radix unsigned} {{/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[26]} -radix unsigned} {{/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[25]} -radix unsigned} {{/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[24]} -radix unsigned} {{/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[23]} -radix unsigned} {{/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[22]} -radix unsigned} {{/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[21]} -radix unsigned} {{/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[20]} -radix unsigned} {{/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[19]} -radix unsigned} {{/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[18]} -radix unsigned} {{/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[17]} -radix unsigned} {{/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[16]} -radix unsigned} {{/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[15]} -radix unsigned} {{/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[14]} -radix unsigned} {{/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[13]} -radix unsigned} {{/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[12]} -radix unsigned} {{/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[11]} -radix unsigned} {{/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[10]} -radix unsigned} {{/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[9]} -radix unsigned} {{/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[8]} -radix unsigned} {{/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[7]} -radix unsigned} {{/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[6]} -radix unsigned} {{/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[5]} -radix unsigned} {{/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[4]} -radix unsigned} {{/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[3]} -radix unsigned} {{/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[2]} -radix unsigned} {{/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[1]} -radix unsigned} {{/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[0]} -radix unsigned}} -expand -subitemconfig {{/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[31]} {-height 15 -radix unsigned} {/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[30]} {-height 15 -radix unsigned} {/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[29]} {-height 15 -radix unsigned} {/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[28]} {-height 15 -radix unsigned} {/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[27]} {-height 15 -radix unsigned} {/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[26]} {-height 15 -radix unsigned} {/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[25]} {-height 15 -radix unsigned} {/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[24]} {-height 15 -radix unsigned} {/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[23]} {-height 15 -radix unsigned} {/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[22]} {-height 15 -radix unsigned} {/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[21]} {-height 15 -radix unsigned} {/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[20]} {-height 15 -radix unsigned} {/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[19]} {-height 15 -radix unsigned} {/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[18]} {-height 15 -radix unsigned} {/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[17]} {-height 15 -radix unsigned} {/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[16]} {-height 15 -radix unsigned} {/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[15]} {-height 15 -radix unsigned} {/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[14]} {-height 15 -radix unsigned} {/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[13]} {-height 15 -radix unsigned} {/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[12]} {-height 15 -radix unsigned} {/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[11]} {-height 15 -radix unsigned} {/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[10]} {-height 15 -radix unsigned} {/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[9]} {-height 15 -radix unsigned} {/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[8]} {-height 15 -radix unsigned} {/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[7]} {-height 15 -radix unsigned} {/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[6]} {-height 15 -radix unsigned} {/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[5]} {-height 15 -radix unsigned} {/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[4]} {-height 15 -radix unsigned} {/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[3]} {-height 15 -radix unsigned} {/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[2]} {-height 15 -radix unsigned} {/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[1]} {-height 15 -radix unsigned} {/Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q[0]} {-height 15 -radix unsigned}} /Embertrail_ctrl_vlg_tst/i1/i1/RF/r_q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 322
configure wave -valuecolwidth 202
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {94 ns}
