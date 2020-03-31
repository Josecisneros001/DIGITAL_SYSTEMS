for i in {Multiplexor4_1,Full_A,Half_A,Multiplier,Multiplexor4_1_tb,Full_A_tb,Multiplier_tb}; do 
ghdl -a $i.vhdl
ghdl -e $i
done
ghdl -r $i --stop-time=30ns --vcd=$i.vcd
gtkwave $i.vcd &

