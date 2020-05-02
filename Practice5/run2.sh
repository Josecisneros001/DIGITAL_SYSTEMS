for i in {FF_JK,Counter4B,Counter4B_tb,Counter0_9,Counter0_9_tb,Counter1_12,Counter1_12_tb,FrequencyDivider_60,FrequencyDivider_60_tb}; do 
ghdl -a $i.vhdl
ghdl -e $i
done
ghdl -r $i --stop-time=420ns --vcd=$i.vcd
gtkwave $i.vcd

