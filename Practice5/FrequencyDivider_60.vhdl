entity FrequencyDivider_60 is
    port(
        CLK: in bit;
        Z: out bit
        );
end FrequencyDivider_60;
 
architecture arch of FrequencyDivider_60 is
    component Counter4B is
        port(
            CLK: in bit;
            CLEAR: in bit;
            PRESET: in bit_vector(3 downto 0);
            EN: in bit;
            Z: out bit_vector(3 downto 0)
            );
    end component;
    signal intQ1: bit_vector(3 downto 0);
    signal intQ2: bit_vector(3 downto 0);
    signal intQ: bit_vector(7 downto 0);
    signal en2: bit;
    signal clear0_9 : bit;
begin
    en2 <= intQ(0) and intQ(1) and intQ(2) and intQ(3);
    intQ <= intQ2 & intQ1;
    Z<=(intQ(0) and intQ(1) and intQ(3) and intQ(4) and intQ(5));
    clear0_9 <= not (intQ(2) and intQ(3) and intQ(4) and intQ(5));
    B4_1: Counter4B port map(CLK,clear0_9,"1111",'1',intQ1);
    B4_2: Counter4B port map(CLK,clear0_9,"1111",en2,intQ2);
end arch;