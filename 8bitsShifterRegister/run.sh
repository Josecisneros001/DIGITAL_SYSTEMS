for i in {e_74194,e_8bitShiftRegister,e_8bitShiftRegister_tb}; do 
ghdl -a $i.vhdl
ghdl -e $i
done
ghdl -r $i --stop-time=185ns --vcd=$i.vcd
gtkwave $i.vcd

