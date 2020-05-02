entity Counter1_12 is
    port(
        CLK: in bit;
        CLEAR: in bit;
        PRESET: in bit;
        EN: in bit;
        Z: out bit_vector(4 downto 0)
        );
end Counter1_12;
 
architecture arch of Counter1_12 is
    component FF_JK is
        port(
            CLK,J,K,PRESET,CLEAR,EN: in bit;
            Q,Qn: out bit
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
    signal const1: bit := '1';
    signal intQ4: bit_vector(3 downto 0);
    signal intQ1: bit;
    signal set1: bit_vector(3 downto 0);
    signal enFF: bit;
    signal clear0_12: bit;
begin
    clear0_12 <= CLEAR and  not (intQ4(0) and intQ4(1) and intQ1); 
    enFF <= EN and intQ4(3) and intQ4(0);
    set1 <= PRESET & PRESET & PRESET & (PRESET and (intQ1 or intQ4(0) or intQ4(1) or intQ4(2) or intQ4(3))); 
    B4: Counter0_9 port map(CLK,clear0_12,set1,EN,intQ4);
    F0: FF_JK port map(CLK=>CLK,J=>const1,K=>const1,PRESET=>PRESET,CLEAR=>clear0_12,Q=>intQ1,EN=>enFF);
    Z <= intQ1 & intQ4;
    
end arch;