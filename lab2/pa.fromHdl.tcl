
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name lab2 -dir "E:/FzpFPAGLab/lab2/planAhead_run_1" -part xc3s100ecp132-5
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "loop_top.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {loop.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top loop_top $srcset
add_files [list {loop_top.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s100ecp132-5
