
# Hello World 
## Create 
#### hello_world.vhdl
## Run
#### ghdl -a hello_world.vhdl 
#### ghdl -e hello_world
#### ghdl -r hello_world
## OUTPUT 
[hello_world.png](hello_world.png)

# Heartbeat 
## Create
#### heartbeat.vhdl
## Run
#### ghdl -a heartbeat.vhdl
#### ghdl -e heartbeat
#### ghdl -r heartbeat
#### ghdl -r heartbeat --wave=wave.ghw

## Open file wave.ghw in gtkwave

## OUTPUT
[heartbeat.png](heartbeat.png)
[wave.png](wave.png)

# Adder
## Create
#### adder.vhdl 
## Run
#### ghdl -a adder.vhdl
## Create
#### adder_tb.vhdl 
## Run
#### ghdl -a adder_tb.vhdl
#### ghdl -e adder_tb
#### ghdl -r adder_tb
## OUTPUT
[adder_tb.png](adder_tb.png)
