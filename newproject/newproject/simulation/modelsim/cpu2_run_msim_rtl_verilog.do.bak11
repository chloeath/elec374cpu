transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/chloe/374project/newproject/newproject {C:/Users/chloe/374project/newproject/newproject/Bus.v}
vlog -vlog01compat -work work +incdir+C:/Users/chloe/374project/newproject/newproject {C:/Users/chloe/374project/newproject/newproject/DataPath.v}
vlog -vlog01compat -work work +incdir+C:/Users/chloe/374project/newproject/newproject {C:/Users/chloe/374project/newproject/newproject/register.v}
vlog -vlog01compat -work work +incdir+C:/Users/chloe/374project/newproject/newproject {C:/Users/chloe/374project/newproject/newproject/mdrReg.v}
vlog -vlog01compat -work work +incdir+C:/Users/chloe/374project/newproject/newproject {C:/Users/chloe/374project/newproject/newproject/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/chloe/374project/newproject/newproject {C:/Users/chloe/374project/newproject/newproject/ADD.v}
vlog -vlog01compat -work work +incdir+C:/Users/chloe/374project/newproject/newproject {C:/Users/chloe/374project/newproject/newproject/NEG.v}
vlog -vlog01compat -work work +incdir+C:/Users/chloe/374project/newproject/newproject {C:/Users/chloe/374project/newproject/newproject/SHL.v}
vlog -vlog01compat -work work +incdir+C:/Users/chloe/374project/newproject/newproject {C:/Users/chloe/374project/newproject/newproject/SHR.v}
vlog -vlog01compat -work work +incdir+C:/Users/chloe/374project/newproject/newproject {C:/Users/chloe/374project/newproject/newproject/SHRA.v}
vlog -vlog01compat -work work +incdir+C:/Users/chloe/374project/newproject/newproject {C:/Users/chloe/374project/newproject/newproject/AND_mod.v}
vlog -vlog01compat -work work +incdir+C:/Users/chloe/374project/newproject/newproject {C:/Users/chloe/374project/newproject/newproject/OR_mod.v}
vlog -vlog01compat -work work +incdir+C:/Users/chloe/374project/newproject/newproject {C:/Users/chloe/374project/newproject/newproject/ROL.v}
vlog -vlog01compat -work work +incdir+C:/Users/chloe/374project/newproject/newproject {C:/Users/chloe/374project/newproject/newproject/ROR.v}
vlog -vlog01compat -work work +incdir+C:/Users/chloe/374project/newproject/newproject {C:/Users/chloe/374project/newproject/newproject/MUL.v}
vlog -vlog01compat -work work +incdir+C:/Users/chloe/374project/newproject/newproject {C:/Users/chloe/374project/newproject/newproject/NOT_mod.v}
vlog -vlog01compat -work work +incdir+C:/Users/chloe/374project/newproject/newproject {C:/Users/chloe/374project/newproject/newproject/SUB.v}
vlog -vlog01compat -work work +incdir+C:/Users/chloe/374project/newproject/newproject {C:/Users/chloe/374project/newproject/newproject/DIV.v}
vlog -vlog01compat -work work +incdir+C:/Users/chloe/374project/newproject/newproject {C:/Users/chloe/374project/newproject/newproject/register_R0.v}
vlog -vlog01compat -work work +incdir+C:/Users/chloe/374project/newproject/newproject {C:/Users/chloe/374project/newproject/newproject/MDMux.v}
vlog -vlog01compat -work work +incdir+C:/Users/chloe/374project/newproject/newproject {C:/Users/chloe/374project/newproject/newproject/MAR.v}
vlog -vlog01compat -work work +incdir+C:/Users/chloe/374project/newproject/newproject {C:/Users/chloe/374project/newproject/newproject/sel_enc_log.v}
vlog -vlog01compat -work work +incdir+C:/Users/chloe/374project/newproject/newproject {C:/Users/chloe/374project/newproject/newproject/RAM.v}
vlog -vlog01compat -work work +incdir+C:/Users/chloe/374project/newproject/newproject {C:/Users/chloe/374project/newproject/newproject/PC_reg.v}

vlog -vlog01compat -work work +incdir+C:/Users/chloe/374project/newproject/newproject {C:/Users/chloe/374project/newproject/newproject/out_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  out_tb

add wave *
view structure
view signals
run 500 ns
