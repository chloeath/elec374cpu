transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/chloe/374project/newproject/newproject {C:/Users/chloe/374project/newproject/newproject/RAM.v}

vlog -vlog01compat -work work +incdir+C:/Users/chloe/374project/newproject/newproject {C:/Users/chloe/374project/newproject/newproject/tbld.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tbld

add wave *
view structure
view signals
run -all
