library ieee;
use ieee.std_logic_1164.all;

entity ffd is 
    port(
        clk, d, reset : in std_logic;
        q : out std_logic   
    );
end ffd;

architecture arch of ffd is
begin
    process(reset,clk)
    begin
        if reset='1' then
            q <= '0';
        elsif clk='1' and clk'event then
            q <= d;
        end if;
    end process;
end arch;