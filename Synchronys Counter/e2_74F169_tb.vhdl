library IEEE;
use IEEE.numeric_bit.all;

entity e2_74F169_tb is
end e2_74F169_tb;

architecture arch of e2_74F169_tb is
    component e2_74F169 is
        port(    
            CP,CEP,CET,UD : in bit;
            TC: out bit;
            Q : out bit_vector(7 downto 0)
        );
    end component;
    signal CP,CEP,CET,UD : bit := '0';
    signal D : bit_vector(7 downto 0);
    signal TC: bit;
    signal Q : bit_vector(7 downto 0);
begin
    E0: e2_74F169 port map(CP,CEP,CET,UD,TC,Q);
    CP_process : process
    begin
        CP<='0';
        wait for 5 ns;
        CP<='1';
        wait for 5 ns;
    end process;

    PE_process : process
    begin
        wait for 200 ns;
        UD<='1';
        wait;
    end process;
end arch;