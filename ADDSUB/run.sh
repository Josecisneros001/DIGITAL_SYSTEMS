for i in {Full_A,addsub,addsub_tb}; do 
ghdl -a $i.vhdl
ghdl -e $i
done
ghdl -r $i --stop-time=70ns --vcd=$i.vcd
gtkwave $i.vcd

