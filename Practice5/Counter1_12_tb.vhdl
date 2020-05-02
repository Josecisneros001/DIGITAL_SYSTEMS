entity Counter1_12_tb is
end Counter1_12_tb;
 
architecture arch of Counter1_12_tb is
    component Counter1_12 is
        port(
            CLK: in bit;
            CLEAR: in bit;
            PRESET: in bit;
            EN: in bit;
            Z: out bit_vector(4 downto 0)
            );
    end component;
    signal CLK: bit := '0';
    signal CLEAR: bit := '1';
    signal PRESET: bit := '1';
    signal EN: bit := '1';
    signal Z: bit_vector(4 downto 0);
begin
    FS0: Counter1_12 port map(CLK,CLEAR,PRESET,EN,Z);
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