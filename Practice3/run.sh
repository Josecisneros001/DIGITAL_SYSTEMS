for i in {FF_JK,Counter4B,FF_JK_tb,Counter4B_tb,CounterD_tb,Counter4B_UD,Counter4B_UD_tb,CounterD_UD,CounterD_UD_tb,Counter99,Counter99_tb}; do 
ghdl -a $i.vhdl
ghdl -e $i
done
ghdl -r $i --stop-time=420ns --vcd=$i.vcd
gtkwave $i.vcd

