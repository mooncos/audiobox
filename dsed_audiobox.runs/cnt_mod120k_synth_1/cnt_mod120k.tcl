# 
# Synthesis run script generated by Vivado
# 

set_param project.vivado.isBlockSynthRun true
set_msg_config -msgmgr_mode ooc_run
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/home/archivos_dsed_lab/dsed_audiobox/dsed_audiobox.cache/wt [current_project]
set_property parent.project_path C:/home/archivos_dsed_lab/dsed_audiobox/dsed_audiobox.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part digilentinc.com:nexys4_ddr:part0:1.1 [current_project]
set_property ip_output_repo c:/home/archivos_dsed_lab/dsed_audiobox/dsed_audiobox.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_ip -quiet c:/home/archivos_dsed_lab/dsed_audiobox/dsed_audiobox.srcs/sources_1/ip/cnt_mod120k/cnt_mod120k.xci
set_property used_in_implementation false [get_files -all c:/home/archivos_dsed_lab/dsed_audiobox/dsed_audiobox.srcs/sources_1/ip/cnt_mod120k/cnt_mod120k_ooc.xdc]
set_property is_locked true [get_files c:/home/archivos_dsed_lab/dsed_audiobox/dsed_audiobox.srcs/sources_1/ip/cnt_mod120k/cnt_mod120k.xci]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]

set cached_ip [config_ip_cache -export -no_bom -use_project_ipc -dir C:/home/archivos_dsed_lab/dsed_audiobox/dsed_audiobox.runs/cnt_mod120k_synth_1 -new_name cnt_mod120k -ip [get_ips cnt_mod120k]]

if { $cached_ip eq {} } {

synth_design -top cnt_mod120k -part xc7a100tcsg324-1 -mode out_of_context

#---------------------------------------------------------
# Generate Checkpoint/Stub/Simulation Files For IP Cache
#---------------------------------------------------------
catch {
 write_checkpoint -force -noxdef -rename_prefix cnt_mod120k_ cnt_mod120k.dcp

 set ipCachedFiles {}
 write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ cnt_mod120k_stub.v
 lappend ipCachedFiles cnt_mod120k_stub.v

 write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ cnt_mod120k_stub.vhdl
 lappend ipCachedFiles cnt_mod120k_stub.vhdl

 write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ cnt_mod120k_sim_netlist.v
 lappend ipCachedFiles cnt_mod120k_sim_netlist.v

 write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ cnt_mod120k_sim_netlist.vhdl
 lappend ipCachedFiles cnt_mod120k_sim_netlist.vhdl

 config_ip_cache -add -dcp cnt_mod120k.dcp -move_files $ipCachedFiles -use_project_ipc -ip [get_ips cnt_mod120k]
}

rename_ref -prefix_all cnt_mod120k_

write_checkpoint -force -noxdef cnt_mod120k.dcp

catch { report_utilization -file cnt_mod120k_utilization_synth.rpt -pb cnt_mod120k_utilization_synth.pb }

if { [catch {
  file copy -force C:/home/archivos_dsed_lab/dsed_audiobox/dsed_audiobox.runs/cnt_mod120k_synth_1/cnt_mod120k.dcp c:/home/archivos_dsed_lab/dsed_audiobox/dsed_audiobox.srcs/sources_1/ip/cnt_mod120k/cnt_mod120k.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  write_verilog -force -mode synth_stub c:/home/archivos_dsed_lab/dsed_audiobox/dsed_audiobox.srcs/sources_1/ip/cnt_mod120k/cnt_mod120k_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode synth_stub c:/home/archivos_dsed_lab/dsed_audiobox/dsed_audiobox.srcs/sources_1/ip/cnt_mod120k/cnt_mod120k_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_verilog -force -mode funcsim c:/home/archivos_dsed_lab/dsed_audiobox/dsed_audiobox.srcs/sources_1/ip/cnt_mod120k/cnt_mod120k_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode funcsim c:/home/archivos_dsed_lab/dsed_audiobox/dsed_audiobox.srcs/sources_1/ip/cnt_mod120k/cnt_mod120k_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}


} else {


if { [catch {
  file copy -force C:/home/archivos_dsed_lab/dsed_audiobox/dsed_audiobox.runs/cnt_mod120k_synth_1/cnt_mod120k.dcp c:/home/archivos_dsed_lab/dsed_audiobox/dsed_audiobox.srcs/sources_1/ip/cnt_mod120k/cnt_mod120k.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  file rename -force C:/home/archivos_dsed_lab/dsed_audiobox/dsed_audiobox.runs/cnt_mod120k_synth_1/cnt_mod120k_stub.v c:/home/archivos_dsed_lab/dsed_audiobox/dsed_audiobox.srcs/sources_1/ip/cnt_mod120k/cnt_mod120k_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  file rename -force C:/home/archivos_dsed_lab/dsed_audiobox/dsed_audiobox.runs/cnt_mod120k_synth_1/cnt_mod120k_stub.vhdl c:/home/archivos_dsed_lab/dsed_audiobox/dsed_audiobox.srcs/sources_1/ip/cnt_mod120k/cnt_mod120k_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  file rename -force C:/home/archivos_dsed_lab/dsed_audiobox/dsed_audiobox.runs/cnt_mod120k_synth_1/cnt_mod120k_sim_netlist.v c:/home/archivos_dsed_lab/dsed_audiobox/dsed_audiobox.srcs/sources_1/ip/cnt_mod120k/cnt_mod120k_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  file rename -force C:/home/archivos_dsed_lab/dsed_audiobox/dsed_audiobox.runs/cnt_mod120k_synth_1/cnt_mod120k_sim_netlist.vhdl c:/home/archivos_dsed_lab/dsed_audiobox/dsed_audiobox.srcs/sources_1/ip/cnt_mod120k/cnt_mod120k_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

}; # end if cached_ip 

if {[file isdir C:/home/archivos_dsed_lab/dsed_audiobox/dsed_audiobox.ip_user_files/ip/cnt_mod120k]} {
  catch { 
    file copy -force c:/home/archivos_dsed_lab/dsed_audiobox/dsed_audiobox.srcs/sources_1/ip/cnt_mod120k/cnt_mod120k_stub.v C:/home/archivos_dsed_lab/dsed_audiobox/dsed_audiobox.ip_user_files/ip/cnt_mod120k
  }
}

if {[file isdir C:/home/archivos_dsed_lab/dsed_audiobox/dsed_audiobox.ip_user_files/ip/cnt_mod120k]} {
  catch { 
    file copy -force c:/home/archivos_dsed_lab/dsed_audiobox/dsed_audiobox.srcs/sources_1/ip/cnt_mod120k/cnt_mod120k_stub.vhdl C:/home/archivos_dsed_lab/dsed_audiobox/dsed_audiobox.ip_user_files/ip/cnt_mod120k
  }
}