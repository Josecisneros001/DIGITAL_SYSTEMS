entity controller is
    port(
        CLK: in bit;
        CLEAR: in bit;
        A: in bit_vector(15 downto 0);
        D: in bit_vector(3 downto 0);
        --DP,G,F,E,D,C,B,A
        Z: out bit_vector(7 downto 0);
        E: out bit_vector(3 downto 0)
    );
end controller;

architecture arch of controller is
    component Counter2B is
        port(
            CLK: in bit;
            CLEAR: in bit;
            PRESET: in bit;
            EN: in bit;
            Z: out bit_vector(1 downto 0)
            );
    end component;
    component Multiplexor4_1 is
        port(
            A: in bit_vector(3 downto 0);
            S: in bit_vector(1 downto 0);
            Z: out bit
        );
    end component;
    component decoder7 is
        port(
            S:in bit_vector(3 downto 0);
            Z:out bit_vector(6 downto 0)
        );
    end component;
    signal Zint: bit_vector(1 downto 0);
    --4 BITS AND DECIMAL POINT
    signal Act: bit_vector(4 downto 0);
    --A-G
    signal ActD: bit_vector(6 downto 0);
begin
    FS0:Counter2B port map(CLK,CLEAR,'1','1',Zint);
    
    --Enables Displays
    E(0)<=not Zint(0) and not Zint(1);
    E(1)<=    Zint(0) and not Zint(1);
    E(2)<=not Zint(0) and     Zint(1);
    E(3)<=    Zint(0) and     Zint(1);
    
    --Multiplexing of bits
    MS0:Multiplexor4_1 port map( A(0)=>A(0) ,A(1)=>A(4), A(2)=>A(8) , A(3)=>A(12),S=>Zint,Z=>Act(3));
    MS1:Multiplexor4_1 port map( A(0)=>A(1) ,A(1)=>A(5), A(2)=>A(9) , A(3)=>A(13),S=>Zint,Z=>Act(2));
    MS2:Multiplexor4_1 port map( A(0)=>A(2) ,A(1)=>A(6), A(2)=>A(10), A(3)=>A(14),S=>Zint,Z=>Act(1));
    MS3:Multiplexor4_1 port map( A(0)=>A(3) ,A(1)=>A(7), A(2)=>A(11), A(3)=>A(15),S=>Zint,Z=>Act(0));
    MS4:Multiplexor4_1 port map( A(0)=>D(0) ,A(1)=>D(1), A(2)=>D(2),  A(3)=>D(3) ,S=>Zint,Z=>Act(4));
    
    --DECODER
    DS0:decoder7 port map(S(0)=>Act(0), S(1)=>Act(1), S(2)=>Act(2), S(3)=>Act(3),Z=>ActD);
    
    Z <= Act(4) & ActD;
    

end arch;