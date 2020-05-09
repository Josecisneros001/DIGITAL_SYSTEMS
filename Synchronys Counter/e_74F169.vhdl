library IEEE;
use IEEE.numeric_bit.all;

entity e_74F169 is
    port(    
        CP,CEP,CET,UD,PE : in bit;
        D : in bit_vector(3 downto 0);
        TC: out bit;
        Q : out bit_vector(3 downto 0)
    );
end e_74F169;

architecture arch of e_74F169 is
    signal intQ : unsigned(3 downto 0) := "0000"; 
begin
    TC <= '1' when (TO_INTEGER(intQ)=0 and UD='0') or (TO_INTEGER(intQ)=15 and UD='1') else '0';
    Q <= bit_vector(intQ);
    process(CP)
    begin
        if cp'event and cp='1' then
            if pe = '0' then
                intQ <= unsigned(D);
            elsif CEP = '0' and CET = '0' then
                if ud = '1' then
                    intQ <= intQ + 1;
                else 
                    intQ <= intQ - 1;
                end if;
            end if;
        end if;
    end process;
end arch;