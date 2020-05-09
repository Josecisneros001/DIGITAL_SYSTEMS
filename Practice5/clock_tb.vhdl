entity clock_tb is
end clock_tb;
 
architecture arch of clock_tb is
    component clock is
        port(
            CLK: in bit;
            CLEAR: in bit;
            PRESET: in bit;
            EN: in bit;
            HOURS: out bit_vector(7 downto 0);
            MINUTES: out bit_vector(7 downto 0)
            );
    end component;
    signal CLK: bit := '0';
    signal CLEAR: bit := '1';
    signal PRESET: bit := '1';
    signal EN: bit := '1';
    signal HOURS: bit_vector(7 downto 0);
    signal MINUTES: bit_vector(7 downto 0);
begin
    FS0: clock port map(CLK,CLEAR,PRESET,EN,HOURS,MINUTES);
    CLK_process : process
    begin
        wait for 5 ns;
        CLK<='0';
        wait for 5 ns;
        CLK<='1';
    end process;

    Set_process : process
    begin
        CLEAR<='1';
        wait;
    end process;
end arch;