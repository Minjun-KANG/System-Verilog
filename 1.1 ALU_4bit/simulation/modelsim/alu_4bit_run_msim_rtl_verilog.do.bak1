transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/ansal/OneDrive/Desktop/Source\ code/Quartus/alu_4bit {C:/Users/ansal/OneDrive/Desktop/Source code/Quartus/alu_4bit/alu_4bit.sv}

vlog -sv -work work +incdir+C:/Users/ansal/OneDrive/Desktop/Source\ code/Quartus/alu_4bit {C:/Users/ansal/OneDrive/Desktop/Source code/Quartus/alu_4bit/tb_alu_4bit.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_alu_4bit

add wave *
view structure
view signals
run -all
