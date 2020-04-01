entity Counter2B is
    port(
        CLK: in bit;
        CLEAR: in bit;
        PRESET: in bit;
        EN: in bit;
        Z: out bit_vector(1 downto 0)
        );
end Counter2B;
 
architecture arch of Counter2B is
    component FF_JK is
        port(
            CLK,J,K,PRESET,CLEAR,EN: in bit;
            Q,Qn: out bit
            );
    end component;
    signal intQ: bit_vector(1 downto 0);
    signal intQN: bit_vector(1 downto 0);
    signal intJK: bit_vector(1 downto 0);
begin
    intJK(0)<='1';
    intJK(1)<=intQ(0);
    F0: FF_JK port map(CLK=>CLK,J=>intJK(0),K=>intJK(0),PRESET=>PRESET,CLEAR=>CLEAR,Q=>intQ(0),Qn=>intQN(0),EN=>EN);
    F1: FF_JK port map(CLK=>CLK,J=>intJK(1),K=>intJK(1),PRESET=>PRESET,CLEAR=>CLEAR,Q=>intQ(1),Qn=>intQN(1),EN=>EN);
    Z(0)<=intQ(0);
    Z(1)<=intQ(1);
    
end arch;