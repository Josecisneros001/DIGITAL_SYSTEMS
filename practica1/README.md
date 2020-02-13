
#Hello World 
cree hello_world.vhdl

ghdl -a hello_world.vhdl
ghdl -e hello_world
ghdl -r hello_world

#Heartbeat 
cree heartbeat.vhdl

ghdl -a heartbeat.vhdl
ghdl -e heartbeat
ghdl -r heartbeat

ghdl -r heartbeat --wave=wave.ghw
gtkwave wave.ghw
OUTPUT: [wave.png](wave.png)

#Adder
Cree adder.vhdl 

run ghdl -a adder.vhdl

Cree adder_tb.vhdl 

run 
if ($?) { ghdl -a adder_tb.vhdl } ; if ($?) { ghdl -e adder_tb } ; if ($?) { ghdl -r adder_tb }

OUTPUT:
adder_tb.vhdl:52:9:@8ns:(assertion note): end of test
