for i in {vga_sync,vga_pixel_generation,vga,vga_tb}; do 
ghdl -a --ieee=synopsys $i.vhdl
ghdl -e --ieee=synopsys $i
done
ghdl -r --ieee=synopsys $i --stop-time=25us --vcd=$i.vcd
gtkwave $i.vcd
