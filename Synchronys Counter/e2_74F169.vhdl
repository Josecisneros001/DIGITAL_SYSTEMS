library IEEE;
use IEEE.numeric_bit.all;

entity e2_74F169 is
    port(    
        CP,CEP,CET,UD : in bit;
        TC: out bit;
        Q : out bit_vector(7 downto 0)
    );
end e2_74F169;

architecture arch of e2_74F169 is
    component e_74F169 is
        port(    
            CP,CEP,CET,UD,PE : in bit;
            D : in bit_vector(3 downto 0);
            TC: out bit;
            Q : out bit_vector(3 downto 0)
        );
    end component;
    signal TC_1,TC_2,TC1,TC2,nTC1,nTC2,intPE1,intPE2 : bit;
    signal intD : bit_vector(3 downto 0);
    signal intQ : bit_vector(7 downto 0);
begin
    
    TC1 <= '1' when (TO_INTEGER(unsigned(intQ(3 downto 0))) = 9 and UD = '1') or (TO_INTEGER(unsigned(intQ(3 downto 0))) = 0 and UD = '0') else '0';
    TC2 <= '1' when (TO_INTEGER(unsigned(intQ(7 downto 4))) = 9 and UD = '1') or (TO_INTEGER(unsigned(intQ(7 downto 4))) = 0 and UD = '0') else '0';
    nTC1 <= not TC1;
    nTC2 <= not TC2; 

    intPE1 <= '0' when TC1='1' else '1';
    intPE2 <= '0' when TC2='1' and TC1='1' else '1';

    intD <= "1001" when UD = '0' else "0000";
    
    E1: e_74F169 port map(cp, cep, cet,ud,intPE1,intD,TC_1,intQ(3 downto 0));
    E2: e_74F169 port map(cp,nTC1,nTC1,ud,intPE2,intD,TC_2,intQ(7 downto 4));
    
    Q <= intQ;
end arch;