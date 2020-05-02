entity Counter0_9 is
    port(
        CLK: in bit;
        CLEAR: in bit;
        PRESET: in bit_vector(3 downto 0);
        EN: in bit;
        Z: out bit_vector(3 downto 0)
        );
end Counter0_9;
 
architecture arch of Counter0_9 is
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
    signal clear0_9 : bit;
begin
    Z<=intQ4;
    clear0_9 <= CLEAR and not (intQ4(1) and intQ4(3));
    B4: Counter4B port map(CLK,clear0_9,PRESET,EN,intQ4);
end arch;