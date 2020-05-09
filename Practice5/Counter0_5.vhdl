entity Counter0_5 is
    port(
        CLK: in bit;
        CLEAR: in bit;
        PRESET: in bit_vector(3 downto 0);
        EN: in bit;
        Z: out bit_vector(3 downto 0)
        );
end Counter0_5;
 
architecture arch of Counter0_5 is
    component Counter4B is
        port(
            CLK: in bit;
            CLEAR: in bit;
            PRESET: in bit_vector(3 downto 0);
            EN: in bit;
            Z: out bit_vector(3 downto 0)
            );
    end component;
    signal intQ4: bit_vector(3 downto 0);
    signal clear0_5 : bit;
begin
    Z<=intQ4;
    clear0_5 <= CLEAR and not (intQ4(1) and intQ4(2));
    B4: Counter4B port map(CLK,clear0_5,PRESET,EN,intQ4);
end arch;