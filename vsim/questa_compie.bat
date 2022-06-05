@echo off
vlog -l cmpl.log ../sv_string_pkg.sv string_function_test.sv
vsim -l sim.log tb_top -c -do run.tcl
pause
