library IEEE;
use IEEE.numeric_bit.all;

entity e_8bitShiftRegister is
    port(
        clk,clr,s0,s1,sdr,sdl : in bit;
        D : in bit_vector(7 downto 0);
        Z : out bit_vector(7 downto 0)
    );
end e_8bitShiftRegister;

architecture arch of e_8bitShiftRegister is
    component e_74194 is
        port(
            clk,clr,s0,s1,sdr,sdl : in bit;
            D : in bit_vector(3 downto 0);
            Z : out bit_vector(3 downto 0)
        );
    end component;
    signal Z1,Z0: bit_vector(3 downto 0);
begin
    E0 : e_74194 port map(clk,clr,s0,s1,Z1(0),sdl,D(3 downto 0),Z0);
    E1 : e_74194 port map(clk,clr,s0,s1,sdr,Z0(3),D(7 downto 4),Z1);
    Z<= Z1 & Z0;
end arch;
