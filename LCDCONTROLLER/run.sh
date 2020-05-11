for i in {LCD,LCD_tb}; do 
ghdl -a --ieee=synopsys $i.vhdl
ghdl -e --ieee=synopsys $i
done
ghdl -r --ieee=synopsys $i --stop-time=220ns --vcd=$i.vcd
gtkwave $i.vcd

