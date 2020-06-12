for i in {keyboard_v1,keyboard_v1_tb}; do 
ghdl -a --ieee=synopsys $i.vhdl
ghdl -e --ieee=synopsys $i
done
ghdl -r --ieee=synopsys $i --stop-time=4ms --vcd=$i.vcd
gtkwave $i.vcd
