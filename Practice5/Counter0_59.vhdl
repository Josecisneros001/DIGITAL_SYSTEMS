library IEEE;
use IEEE.numeric_bit.all;

entity Counter0_59 is
    port(
        CLK: in bit;
        CLEAR: in bit;
        PRESET: in bit;
        EN: in bit;
        RCO : out bit;
        NCLK: out bit;
        Z: out bit_vector(7 downto 0)
        );
end Counter0_59;
 
architecture arch of Counter0_59 is
    component Counter0_5 is
        port(
            CLK: in bit;
            CLEAR: in bit;
            PRESET: in bit_vector(3 downto 0);
            EN: in bit;
            Z: out bit_vector(3 downto 0)
            );
    end component;
    component Counter0_9 is
        port(
            CLK: in bit;
            CLEAR: in bit;
            PRESET: in bit_vector(3 downto 0);
            EN: in bit;
            Z: out bit_vector(3 downto 0)
            );
    end component;
    signal intQ: bit_vector(7 downto 0);
    signal set: bit_vector(3 downto 0);
    signal enC5: bit;
    signal clear0_5: bit;
    signal clear0_9: bit;
begin
    RCO <= enC5 and intQ(4) and intQ(6); 
    clear0_9 <= CLEAR and  not ( (intQ(5) and intQ(6)) or (intQ(1) and intQ(3)) ); 
    clear0_5 <= CLEAR and  not (intQ(5) and intQ(6)); 
    enC5 <= EN and intQ(0) and intQ(3);
    set <= PRESET & PRESET & PRESET & PRESET; 
    C1: Counter0_9 port map(CLK,clear0_9,set,EN,intQ(3 downto 0));
    C0: Counter0_5 port map(CLK,clear0_5,set,enC5,intQ(7 downto 4));
    Z <= intQ;
    NCLK <= '1' when TO_INTEGER(unsigned(intQ(7 downto 4))) < 3 else '0';
end arch;