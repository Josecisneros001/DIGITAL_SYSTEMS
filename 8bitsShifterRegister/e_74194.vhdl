library IEEE;
use IEEE.numeric_bit.all;

entity e_74194 is
    port(
        clk,clr,s0,s1,sdr,sdl : in bit;
        D : in bit_vector(3 downto 0);
        Z : out bit_vector(3 downto 0)
    );
end e_74194;

architecture arch of e_74194 is
    signal s1s0 : bit_vector(1 downto 0);
    signal intZ : bit_vector(3 downto 0);
begin
    s1s0 <= s1 & s0;
    Z <= intZ;
    process(clk,clr)
        begin
            if clr = '0' then 
                intZ <= "0000";
            elsif clk'event and clk='1' then
                case s1s0 is 
                    when "11" => intZ <= D;
                    when "10" => intZ <= sdr & intZ(3 downto 1);
                    when "01" => intZ <= intZ(2 downto 0) & sdl;
                    when "00" => null;
                end case;
            end if;
    end process;
end arch;
