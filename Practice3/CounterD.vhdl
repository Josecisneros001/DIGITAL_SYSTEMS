entity CounterD is
    port(
        CLK: in bit;
        CLEAR: in bit;
        PRESET: in bit;
        EN: in bit;
        Z: out bit_vector(3 downto 0)
        );
end CounterD;
 
architecture arch of CounterD is
    component Counter4B is
        port(
        CLK: in bit;
        CLEAR: in bit;
        PRESET: in bit;
        EN: in bit;
        Z: out bit_vector(3 downto 0)
        );
    end component;
    signal CLEARint,PRESETint: bit;
    signal Zint: bit_vector(3 downto 0);
begin
    FS0: Counter4B port map(CLK,CLEARint,PRESETint,EN,Zint);
    Z<=Zint;
    PRESETint<=PRESET;
    CLEARint<=CLEAR and (Zint(1) nand Zint(3));
end arch;