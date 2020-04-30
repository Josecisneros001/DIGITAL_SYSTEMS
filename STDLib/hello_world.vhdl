library std;
use std.textio.all;

entity hello_world is
end entity;

architecture arch of hello_world is
begin
    process
        variable l: line;
    begin
        write(l, String'("Hello World!"));
        writeLine(output, l);
        wait for 5 ns;
    end process;
end arch;
--ghdl -r hello_world --stop-time=10ns