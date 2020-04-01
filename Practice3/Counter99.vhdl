entity Counter99 is
    port(
        UD: in bit;
        CLK: in bit;
        CLEAR: in bit;
        PRESET: in bit;
        Z: out bit_vector(7 downto 0)
        );
end Counter99;
 
architecture arch of Counter99 is
    component CounterD_UD is
        port(
            UD: in bit;
            CLK: in bit;
            CLEAR: in bit;
            PRESET: in bit;
            EN: in bit;
            Z: out bit_vector(3 downto 0)
        );
    end component;
    signal Zint1: bit_vector(3 downto 0);
    signal Zint2: bit_vector(3 downto 0);
    signal EN2: bit :='0';
begin
    FS0: CounterD_UD port map(UD,CLK,CLEAR,PRESET,'1',Zint1);
    FS1: CounterD_UD port map(UD,CLK,CLEAR,PRESET,EN2,Zint2);
    EN2<= (UD and Zint1(0) and Zint1(3) ) or (not UD and not Zint1(0) and not Zint1(1) and not Zint1(2) and not Zint1(3)); 
    Z(0)<= Zint1(0);
    Z(1)<= Zint1(1);
    Z(2)<= Zint1(2);
    Z(3)<= Zint1(3);
    Z(4)<= Zint2(0);
    Z(5)<= Zint2(1);
    Z(6)<= Zint2(2);
    Z(7)<= Zint2(3);
end arch;