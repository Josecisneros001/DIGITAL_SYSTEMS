for i in {e_74F169,e_74F169_tb}; do 
ghdl -a $i.vhdl
ghdl -e $i
done
ghdl -r $i --stop-time=420ns --vcd=$i.vcd
gtkwave $i.vcd

