library ieee;
use ieee.std_logic_1164.all;
library IEEE;
use IEEE.numeric_std.all;

entity substractor4bits is
    port(
        en     : in std_logic; 
        a, b   : in std_logic_vector(3 downto 0);
        d  : out std_logic_vector(3 downto 0)
    );
end entity;

architecture arch of substractor4bits is
    
begin
    d <= a when en='0' else std_logic_vector(unsigned(a)-unsigned(b));
end arch;