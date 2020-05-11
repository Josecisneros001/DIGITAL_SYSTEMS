for i in {mux,ffd,register4bits,substractor,substractor4bits,comparator,controller,datapath,GDC,GDC_tb}; do 
ghdl -a $i.vhdl
ghdl -e $i
done
ghdl -r $i --stop-time=420ns --vcd=$i.vcd
gtkwave $i.vcd

