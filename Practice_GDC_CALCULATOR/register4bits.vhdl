library ieee;
use ieee.std_logic_1164.all;

entity register4bits is 
    port(
        d_in : in std_logic_vector(3 downto 0);
        clk, ld , reset : in std_logic;
        d_out : out std_logic_vector(3 downto 0)
    );
end register4bits;

architecture arch of register4bits is
    -- component ffd is 
    -- port(
    --     clk, d, reset : in std_logic;
    --     q : out std_logic   
    -- );
    -- end component;
begin
    process(clk)
    begin
        if(reset = '1') then
            d_out <= "0000";
        elsif risinge

    -- ffd0 : ffd port map(clk,d_in(0),reset,d_out(0));
    -- ffd1 : ffd port map(clk,d_in(1),reset,d_out(1));
    -- ffd2 : ffd port map(clk,d_in(2),reset,d_out(2));
    -- ffd3 : ffd port map(clk,d_in(3),reset,d_out(3)); 

end arch;
