entity Counter4B_UD is
    port(
        UD:in bit;
        CLK: in bit;
        CLEAR: in bit_vector(3 downto 0);
        PRESET: in bit_vector(3 downto 0);
        EN: in bit;
        Z: out bit_vector(3 downto 0)
        );
end Counter4B_UD;
 
architecture arch of Counter4B_UD is
    component FF_JK is
        port(
            CLK,J,K,PRESET,CLEAR,EN: in bit;
            Q,Qn: out bit
            );
    end component;
    signal intQ: bit_vector(3 downto 0);
    signal intJK: bit_vector(3 downto 0);
    signal intU: bit_vector(3 downto 0);
    signal intD: bit_vector(3 downto 0);
    signal intQN: bit_vector(3 downto 0);
begin
    --UP
    intU(0)<=UD;
    intU(1)<=intU(0) and intQ(0);
    intU(2)<=intU(1) and intQ(1);
    intU(3)<=intU(2) and intQ(2);
    --DOWN
    intD(0)<=not UD;
    intD(1)<=intD(0) and intQN(0);
    intD(2)<=intD(1) and intQN(1);
    intD(3)<=intD(2) and intQN(2);
    --JK
    intJK(0)<='1';
    intJK(1)<=intU(1) or intD(1);
    intJK(2)<=intU(2) or intD(2);
    intJK(3)<=intU(3) or intD(3);
    
    F0: FF_JK port map(CLK=>CLK,J=>intJK(0),K=>intJK(0),PRESET=>PRESET(0),CLEAR=>CLEAR(0),EN=>EN,Q=>intQ(0),Qn=>intQN(0));
    F1: FF_JK port map(CLK=>CLK,J=>intJK(1),K=>intJK(1),PRESET=>PRESET(1),CLEAR=>CLEAR(1),EN=>EN,Q=>intQ(1),Qn=>intQN(1));
    F2: FF_JK port map(CLK=>CLK,J=>intJK(2),K=>intJK(2),PRESET=>PRESET(2),CLEAR=>CLEAR(2),EN=>EN,Q=>intQ(2),Qn=>intQN(2));
    F3: FF_JK port map(CLK=>CLK,J=>intJK(3),K=>intJK(3),PRESET=>PRESET(3),CLEAR=>CLEAR(3),EN=>EN,Q=>intQ(3),Qn=>intQN(3));
    
    Z(0)<=intQ(0);
    Z(1)<=intQ(1);
    Z(2)<=intQ(2);
    Z(3)<=intQ(3);
    
end arch;