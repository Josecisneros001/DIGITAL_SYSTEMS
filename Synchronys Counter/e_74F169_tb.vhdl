library IEEE;
use IEEE.numeric_bit.all;

entity e_74F169_tb is
end e_74F169_tb;

architecture arch of e_74F169_tb is
    component e_74F169 is
        port(    
            CP,CEP,CET,UD,PE : in bit;
            D : in bit_vector(3 downto 0);
            TC: out bit;
            Q : out bit_vector(3 downto 0)
        );
    end component;
    signal CP,CEP,CET,UD,PE : bit := '0';
    signal D : bit_vector(3 downto 0);
    signal TC: bit;
    signal Q : bit_vector(3 downto 0);
begin
    E0: e_74F169 port map(CP,CEP,CET,UD,PE,D,TC,Q);
    CP_process : process
    begin
        CP<='0';
        wait for 5 ns;
        CP<='1';
        wait for 5 ns;
    end process;

    PE_process : process
    begin
        PE<='1';
        wait for 115 ns;
        UD<='1';
        wait for 115 ns;
        D <= "1111";
        PE<='0';
        wait for 6 ns;
        PE <= '1';
        wait;
    end process;
end arch;