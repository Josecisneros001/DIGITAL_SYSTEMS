library ieee;
use ieee.std_logic_1164.all;

entity mux is
    port(
        x,y : in std_logic_vector(3 downto 0);
        sel : in std_logic;
        res : out std_logic_vector(3 downto 0)
    );
end entity mux;

architecture arch of mux is
begin
    process(sel)
    begin
        if sel = '1' then
            res <= x;
        elsif sel = '0' then
            res <= y;
        end if;
    end process;
end arch;