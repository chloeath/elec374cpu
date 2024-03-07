transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/20mvdp/Downloads/newproject/newproject {C:/Users/20mvdp/Downloads/newproject/newproject/Bus.v}
vlog -vlog01compat -work work +incdir+C:/Users/20mvdp/Downloads/newproject/newproject {C:/Users/20mvdp/Downloads/newproject/newproject/DataPath.v}
vlog -vlog01compat -work work +incdir+C:/Users/20mvdp/Downloads/newproject/newproject {C:/Users/20mvdp/Downloads/newproject/newproject/register.v}
vlog -vlog01compat -work work +incdir+C:/Users/20mvdp/Downloads/newproject/newproject {C:/Users/20mvdp/Downloads/newproject/newproject/mdrReg.v}
vlog -vlog01compat -work work +incdir+C:/Users/20mvdp/Downloads/newproject/newproject {C:/Users/20mvdp/Downloads/newproject/newproject/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/20mvdp/Downloads/newproject/newproject {C:/Users/20mvdp/Downloads/newproject/newproject/ADD.v}
vlog -vlog01compat -work work +incdir+C:/Users/20mvdp/Downloads/newproject/newproject {C:/Users/20mvdp/Downloads/newproject/newproject/NEG.v}
vlog -vlog01compat -work work +incdir+C:/Users/20mvdp/Downloads/newproject/newproject {C:/Users/20mvdp/Downloads/newproject/newproject/SHL.v}
vlog -vlog01compat -work work +incdir+C:/Users/20mvdp/Downloads/newproject/newproject {C:/Users/20mvdp/Downloads/newproject/newproject/SHR.v}
vlog -vlog01compat -work work +incdir+C:/Users/20mvdp/Downloads/newproject/newproject {C:/Users/20mvdp/Downloads/newproject/newproject/SHRA.v}
vlog -vlog01compat -work work +incdir+C:/Users/20mvdp/Downloads/newproject/newproject {C:/Users/20mvdp/Downloads/newproject/newproject/AND_mod.v}
vlog -vlog01compat -work work +incdir+C:/Users/20mvdp/Downloads/newproject/newproject {C:/Users/20mvdp/Downloads/newproject/newproject/OR_mod.v}
vlog -vlog01compat -work work +incdir+C:/Users/20mvdp/Downloads/newproject/newproject {C:/Users/20mvdp/Downloads/newproject/newproject/ROL.v}
vlog -vlog01compat -work work +incdir+C:/Users/20mvdp/Downloads/newproject/newproject {C:/Users/20mvdp/Downloads/newproject/newproject/ROR.v}
vlog -vlog01compat -work work +incdir+C:/Users/20mvdp/Downloads/newproject/newproject {C:/Users/20mvdp/Downloads/newproject/newproject/MUL.v}
vlog -vlog01compat -work work +incdir+C:/Users/20mvdp/Downloads/newproject/newproject {C:/Users/20mvdp/Downloads/newproject/newproject/NOT_mod.v}
vlog -vlog01compat -work work +incdir+C:/Users/20mvdp/Downloads/newproject/newproject {C:/Users/20mvdp/Downloads/newproject/newproject/SUB.v}
vlog -vlog01compat -work work +incdir+C:/Users/20mvdp/Downloads/newproject/newproject {C:/Users/20mvdp/Downloads/newproject/newproject/DIV.v}

vlog -vlog01compat -work work +incdir+C:/Users/20mvdp/Downloads/newproject/newproject {C:/Users/20mvdp/Downloads/newproject/newproject/tbtestalu.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tbtestalu

add wave *
view structure
view signals
run 600 ns
