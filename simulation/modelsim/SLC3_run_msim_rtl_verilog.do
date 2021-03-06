transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/ece385/SLC3 {C:/ece385/SLC3/RegFile.sv}
vlog -sv -work work +incdir+C:/ece385/SLC3 {C:/ece385/SLC3/MUX3_2to1.sv}
vlog -sv -work work +incdir+C:/ece385/SLC3 {C:/ece385/SLC3/ALU.sv}
vlog -sv -work work +incdir+C:/ece385/SLC3 {C:/ece385/SLC3/HexDriver.sv}
vlog -sv -work work +incdir+C:/ece385/SLC3 {C:/ece385/SLC3/tristate.sv}
vlog -sv -work work +incdir+C:/ece385/SLC3 {C:/ece385/SLC3/SLC3_2.sv}
vlog -sv -work work +incdir+C:/ece385/SLC3 {C:/ece385/SLC3/Mem2IO.sv}
vlog -sv -work work +incdir+C:/ece385/SLC3 {C:/ece385/SLC3/ISDU.sv}
vlog -sv -work work +incdir+C:/ece385/SLC3 {C:/ece385/SLC3/MUX16_4to1.sv}
vlog -sv -work work +incdir+C:/ece385/SLC3 {C:/ece385/SLC3/MUX16_2to1.sv}
vlog -sv -work work +incdir+C:/ece385/SLC3 {C:/ece385/SLC3/Incrementer.sv}
vlog -sv -work work +incdir+C:/ece385/SLC3 {C:/ece385/SLC3/Reg16.sv}
vlog -sv -work work +incdir+C:/ece385/SLC3 {C:/ece385/SLC3/MUX16_BUS.sv}
vlog -sv -work work +incdir+C:/ece385/SLC3 {C:/ece385/SLC3/Branch.sv}
vlog -sv -work work +incdir+C:/ece385/SLC3 {C:/ece385/SLC3/NZP.sv}
vlog -sv -work work +incdir+C:/ece385/SLC3 {C:/ece385/SLC3/SEXT.sv}
vlog -sv -work work +incdir+C:/ece385/SLC3 {C:/ece385/SLC3/SEXT9.sv}
vlog -sv -work work +incdir+C:/ece385/SLC3 {C:/ece385/SLC3/SEXT6.sv}
vlog -sv -work work +incdir+C:/ece385/SLC3 {C:/ece385/SLC3/SEXT5.sv}
vlog -sv -work work +incdir+C:/ece385/SLC3 {C:/ece385/SLC3/Sync.sv}
vlog -sv -work work +incdir+C:/ece385/SLC3 {C:/ece385/SLC3/test_memory.sv}
vlog -sv -work work +incdir+C:/ece385/SLC3 {C:/ece385/SLC3/datapath.sv}
vlog -sv -work work +incdir+C:/ece385/SLC3 {C:/ece385/SLC3/top_level.sv}
vlog -sv -work work +incdir+C:/ece385/SLC3 {C:/ece385/SLC3/slc3.sv}

vlog -sv -work work +incdir+C:/ece385/SLC3 {C:/ece385/SLC3/testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run 1000 ns
