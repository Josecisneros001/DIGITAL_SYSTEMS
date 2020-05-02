entity Counter4B is
    port(
        CLK: in bit;
        CLEAR: in bit;
        PRESET: in bit_vector(3 downto 0);
        EN: in bit;
        Z: out bit_vector(3 downto 0)
        );
end Counter4B;
 
architecture arch of Counter4B is
    component FF_JK is
        port(
            CLK,J,K,PRESET,CLEAR,EN: in bit;
            Q,Qn: out bit
            );
    end component;
    signal intQ: bit_vector(3 downto 0);
    signal intJK: bit_vector(3 downto 0);
    signal intQN: bit_vector(3 downto 0);
begin
    intJK(0)<='1';
    intJK(1)<=intQ(0);
    intJK(2)<=intQ(0) and intQ(1);
    intJK(3)<=intJK(2) and intQ(2);
    F0: FF_JK port map(CLK=>CLK,J=>intJK(0),K=>intJK(0),PRESET=>PRESET(0),CLEAR=>CLEAR,Q=>intQ(0),Qn=>intQN(0),EN=>EN);
    F1: FF_JK port map(CLK=>CLK,J=>intJK(1),K=>intJK(1),PRESET=>PRESET(1),CLEAR=>CLEAR,Q=>intQ(1),Qn=>intQN(1),EN=>EN);
    F2: FF_JK port map(CLK=>CLK,J=>intJK(2),K=>intJK(2),PRESET=>PRESET(2),CLEAR=>CLEAR,Q=>intQ(2),Qn=>intQN(2),EN=>EN);
    F3: FF_JK port map(CLK=>CLK,J=>intJK(3),K=>intJK(3),PRESET=>PRESET(3),CLEAR=>CLEAR,Q=>intQ(3),Qn=>intQN(3),EN=>EN);
    Z<=intQ;
    
end arch;