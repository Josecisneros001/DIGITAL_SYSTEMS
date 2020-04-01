for i in {FF_JK,Counter2B,Multiplexor4_1,controller,controller_tb}; do 
ghdl -a $i.vhdl
ghdl -e $i
done
ghdl -r $i --stop-time=100ns --vcd=$i.vcd
gtkwave $i.vcd

