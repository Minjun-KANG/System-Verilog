transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/ansal/OneDrive/Desktop/Source\ code/Quartus/reg_fp_adder {C:/Users/ansal/OneDrive/Desktop/Source code/Quartus/reg_fp_adder/reg_fp_adder.sv}

vlog -sv -work work +incdir+C:/Users/ansal/OneDrive/Desktop/Source\ code/Quartus/reg_fp_adder {C:/Users/ansal/OneDrive/Desktop/Source code/Quartus/reg_fp_adder/tb_reg_fp_adder.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_reg_fp_adder

add wave *
view structure
view signals
run -all
