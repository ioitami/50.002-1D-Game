set projDir "D:/SUTD/50.002\ CompStruc/1D\ GAME/1D\ GAME/work/vivado"
set projName "1D GAME"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "D:/SUTD/50.002\ CompStruc/1D\ GAME/1D\ GAME/work/verilog/au_top_0.v" "D:/SUTD/50.002\ CompStruc/1D\ GAME/1D\ GAME/work/verilog/counter_1.v" "D:/SUTD/50.002\ CompStruc/1D\ GAME/1D\ GAME/work/verilog/randomgen_2.v" "D:/SUTD/50.002\ CompStruc/1D\ GAME/1D\ GAME/work/verilog/reset_conditioner_3.v" "D:/SUTD/50.002\ CompStruc/1D\ GAME/1D\ GAME/work/verilog/pn_gen_4.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "G:/Program\ Files\ G\ Drive/AlchitryLabs/library/components/au.xdc" "D:/SUTD/50.002\ CompStruc/1D\ GAME/1D\ GAME/work/constraint/io.xdc" "D:/SUTD/50.002\ CompStruc/1D\ GAME/1D\ GAME/work/constraint/alchitry.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
