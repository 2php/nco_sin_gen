onerror {exit -code 1}
vlib work
vlog -work work nco_sin_gen.vo
vlog -work work sin_gen.vwf.vt
vsim -novopt -c -t 1ps -L stratixiv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate_ver -L altera_lnsim_ver work.nco_sin_gen_vlg_vec_tst
vcd file -direction nco_sin_gen.msim.vcd
vcd add -internal nco_sin_gen_vlg_vec_tst/*
vcd add -internal nco_sin_gen_vlg_vec_tst/i1/*
proc simTimestamp {} {
    echo "Simulation time: $::now ps"
    if { [string equal running [runStatus]] } {
        after 2500 simTimestamp
    }
}
after 2500 simTimestamp
run -all
quit -f



