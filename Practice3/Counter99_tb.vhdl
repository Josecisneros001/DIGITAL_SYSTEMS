entity Counter99_tb is
end Counter99_tb;
 
architecture arch of Counter99_tb is
    component Counter99 is
        port(
            UD: in bit;
            CLK: in bit;
            CLEAR: in bit;
            PRESET: in bit;
            Z: out bit_vector(7 downto 0)
            );
    end component;
    signal UD: bit :='1';
    signal CLK: bit :='1';
    signal CLEAR: bit :='1';
    signal PRESET: bit :='1';
    signal Z: bit_vector(7 downto 0);
begin
    FS0: Counter99 port map(UD,CLK,CLEAR,PRESET,Z);
    
    CLK_process : process
    begin
        CLK<='0';
        wait for 5 ns;
        CLK<='1';
        wait for 5 ns;
    end process;

    Set_process : process
    begin
        CLEAR<='0';
        wait for 5 ns;
        CLEAR<='1';
        wait for 100 ns;
        UD<='0';
        wait for 200 ns;
        UD<='1';
        wait for 110 ns;
        UD<='0';
        wait;
    end process;
end arch;