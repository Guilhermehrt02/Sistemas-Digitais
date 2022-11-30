transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.0/Projetos/projetofinal {C:/intelFPGA_lite/18.0/Projetos/projetofinal/registro.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.0/Projetos/projetofinal {C:/intelFPGA_lite/18.0/Projetos/projetofinal/seletor.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.0/Projetos/projetofinal {C:/intelFPGA_lite/18.0/Projetos/projetofinal/ULA.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.0/Projetos/projetofinal {C:/intelFPGA_lite/18.0/Projetos/projetofinal/deslocamento.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.0/Projetos/projetofinal {C:/intelFPGA_lite/18.0/Projetos/projetofinal/controle.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.0/Projetos/projetofinal {C:/intelFPGA_lite/18.0/Projetos/projetofinal/sisDigital.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.0/Projetos/projetofinal {C:/intelFPGA_lite/18.0/Projetos/projetofinal/display.v}

vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.0/Projetos/projetofinal {C:/intelFPGA_lite/18.0/Projetos/projetofinal/sisDigital_TB.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  sisDigital_TB

add wave *
view structure
view signals
run -all
