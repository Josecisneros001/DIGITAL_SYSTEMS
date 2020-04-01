entity CounterD_UD is
    port(
        UD: in bit;
        CLK: in bit;
        CLEAR: in bit;
        PRESET: in bit;
        EN: in bit;
        Z: out bit_vector(3 downto 0)
        );
end CounterD_UD;
 
architecture arch of CounterD_UD is
    component Counter4B_UD is
        port(
            UD:in bit;
            CLK: in bit;
            CLEAR: in bit_vector(3 downto 0);
            PRESET: in bit_vector(3 downto 0);
            EN: in bit;
            Z: out bit_vector(3 downto 0)
        );
    end component;
    signal CLEARint,PRESETint: bit_vector(3 downto 0);
    signal Zint: bit_vector(3 downto 0);
begin
    FS0: Counter4B_UD port map(UD,CLK,CLEARint,PRESETint,EN,Zint);
    Z<=Zint;
    
    PRESETint(0)<=PRESET and not (Zint(0) and Zint(1) and Zint(2) and Zint(3));
    PRESETint(1)<=PRESET;
    PRESETint(2)<=PRESET;
    PRESETint(3)<=PRESET and not (Zint(0) and Zint(1) and Zint(2) and Zint(3));
    
    CLEARint(0)<=CLEAR and not (Zint(1) and Zint(3) and not Zint(0) and not Zint(2));
    CLEARint(1)<=CLEAR and not ((Zint(1) and Zint(3) and not Zint(0) and not Zint(2)) or (Zint(0) and Zint(1) and Zint(2) and Zint(3)));
    CLEARint(2)<=CLEAR and not ((Zint(1) and Zint(3) and not Zint(0) and not Zint(2)) or (Zint(0) and Zint(1) and Zint(2) and Zint(3)));
    CLEARint(3)<=CLEAR and not (Zint(1) and Zint(3) and not Zint(0) and not Zint(2));

end arch;