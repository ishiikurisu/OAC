onerror {quit -f}
vlib work
vlog -work work TopDE-FastCompilation.vo
vlog -work work TopDE-FastCompilation.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.TopDE_vlg_vec_tst
vcd file -direction TopDE-FastCompilation.msim.vcd
vcd add -internal TopDE_vlg_vec_tst/*
vcd add -internal TopDE_vlg_vec_tst/i1/*
add wave /*
run -all
