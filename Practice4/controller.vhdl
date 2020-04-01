entity controller is
    port(
        CLK: in bit;
        CLEAR: in bit;
        A: in bit_vector(15 downto 0);
        D: in bit_vector(3 downto 0);
        Z1: out bit_vector(7 downto 0);
        Z2: out bit_vector(7 downto 0);
        Z3: out bit_vector(7 downto 0);
        Z4: out bit_vector(7 downto 0)
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
    signal ENs: bit_vector(3 downto 0);
    signal Zint: bit_vector(1 downto 0);
    --4 BITS AND DECIMAL POINT
    signal Act: bit_vector(4 downto 0);
    --A-G
    signal ActD: bit_vector(6 downto 0);
begin
    FS0:Counter2B port map(CLK,CLEAR,'1','1',Zint);
    
    --Enables Displays
    ENs(0)<=not Zint(0) and not Zint(1);
    ENs(1)<=    Zint(0) and not Zint(1);
    ENs(2)<=not Zint(0) and     Zint(1);
    ENs(3)<=    Zint(0) and     Zint(1);
    
    --Multiplexing of bits
    MS0:Multiplexor4_1 port map( A(0)=>A(0) ,A(1)=>A(4), A(2)=>A(8) , A(3)=>A(12),S=>Zint,Z=>Act(3));
    MS1:Multiplexor4_1 port map( A(0)=>A(1) ,A(1)=>A(5), A(2)=>A(9) , A(3)=>A(13),S=>Zint,Z=>Act(2));
    MS2:Multiplexor4_1 port map( A(0)=>A(2) ,A(1)=>A(6), A(2)=>A(10), A(3)=>A(14),S=>Zint,Z=>Act(1));
    MS3:Multiplexor4_1 port map( A(0)=>A(3) ,A(1)=>A(7), A(2)=>A(11), A(3)=>A(15),S=>Zint,Z=>Act(0));
    MS4:Multiplexor4_1 port map( A(0)=>D(0) ,A(1)=>D(1), A(2)=>D(2),  A(3)=>D(3) ,S=>Zint,Z=>Act(4));
    
    --DECODER
    DS0:decoder7 port map(S(0)=>Act(0), S(1)=>Act(1), S(2)=>Act(2), S(3)=>Act(3),Z=>ActD);
    
    Z1(7)<=ENs(0) and Act(4);
    Z1(6)<=ENs(0) and ActD(6);
    Z1(5)<=ENs(0) and ActD(5);
    Z1(4)<=ENs(0) and ActD(4);
    Z1(3)<=ENs(0) and ActD(3);
    Z1(2)<=ENs(0) and ActD(2);
    Z1(1)<=ENs(0) and ActD(1);
    Z1(0)<=ENs(0) and ActD(0);
    
    Z2(7)<=ENs(1) and Act(4);
    Z2(6)<=ENs(1) and ActD(6);
    Z2(5)<=ENs(1) and ActD(5);
    Z2(4)<=ENs(1) and ActD(4);
    Z2(3)<=ENs(1) and ActD(3);
    Z2(2)<=ENs(1) and ActD(2);
    Z2(1)<=ENs(1) and ActD(1);
    Z2(0)<=ENs(1) and ActD(0);

    Z3(7)<=ENs(2) and Act(4);
    Z3(6)<=ENs(2) and ActD(6);
    Z3(5)<=ENs(2) and ActD(5);
    Z3(4)<=ENs(2) and ActD(4);
    Z3(3)<=ENs(2) and ActD(3);
    Z3(2)<=ENs(2) and ActD(2);
    Z3(1)<=ENs(2) and ActD(1);
    Z3(0)<=ENs(2) and ActD(0);

    Z4(7)<=ENs(3) and Act(4);
    Z4(6)<=ENs(3) and ActD(6);
    Z4(5)<=ENs(3) and ActD(5);
    Z4(4)<=ENs(3) and ActD(4);
    Z4(3)<=ENs(3) and ActD(3);
    Z4(2)<=ENs(3) and ActD(2);
    Z4(1)<=ENs(3) and ActD(1);
    Z4(0)<=ENs(3) and ActD(0);
     

    end arch;