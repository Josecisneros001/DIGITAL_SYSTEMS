library IEEE;
use IEEE.numeric_bit.all;

entity e_8bitShiftRegister_tb is
end e_8bitShiftRegister_tb;

architecture arch of e_8bitShiftRegister_tb is
    component e_8bitShiftRegister is
        port(
            clk,clr,s0,s1,sdr,sdl : in bit;
            D : in bit_vector(7 downto 0);
            Z : out bit_vector(7 downto 0)
        );
    end component;
    signal clk,clr,s0,s1,sdr,sdl : bit := '0';
    signal D : bit_vector(7 downto 0);
    signal Z : bit_vector(7 downto 0);
begin
    E0 : e_8bitShiftRegister port map(clk,clr,s0,s1,sdr,sdl,D,Z);    

    CLK_process : process
    begin
        CLK<='0';
        wait for 5 ns;
        CLK<='1';
        wait for 5 ns;
    end process;
    
    SET_process : process
    begin
        clr <= '1';
        s0 <= '1';
        sdl <= '1';
        wait for 30 ns;
        sdl <= '0';
        wait for 30 ns;
        s0 <= '0';
        s1 <= '1';
        sdr <= '1';
        wait for 30 ns;
        sdr <= '0';
        wait for 30 ns;
        s0 <= '1';
        D <= "01010101";
        wait for 10 ns;
        s0 <= '0';
        s0 <= '1';
        wait for 20 ns;
        clr <= '0';
        wait;
    end process;
    
end arch;
