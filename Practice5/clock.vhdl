entity clock is
    port(
        CLK: in bit;
        CLEAR: in bit;
        PRESET: in bit;
        EN: in bit;
        HOURS: out bit_vector(7 downto 0);
        MINUTES: out bit_vector(7 downto 0)
        );
end clock;
 
architecture arch of clock is
    component Counter0_59 is
        port(
            CLK: in bit;
            CLEAR: in bit;
            PRESET: in bit;
            EN: in bit;
            RCO: out bit;
            NCLK: out bit;
            Z: out bit_vector(7 downto 0)
            );
    end component;
    component Counter1_12 is
        port(
            CLK: in bit;
            CLEAR: in bit;
            PRESET: in bit;
            EN: in bit;
            Z: out bit_vector(7 downto 0)
            );
    end component;
    signal RCO_59 : bit;
    signal NCLK_59 : bit;
begin
    C1: Counter0_59 port map(CLK,CLEAR,PRESET,EN,RCO_59,NCLK_59,MINUTES);
    C0: Counter1_12 port map(CLK,CLEAR,PRESET,RCO_59,HOURS);
   
end arch;