entity CounterD_UD_tb is
end CounterD_UD_tb;
 
architecture arch of CounterD_UD_tb is
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
    signal UD: bit := '1';
    signal CLK: bit := '0';
    signal CLEAR: bit := '1';
    signal PRESET: bit := '1';
    signal EN: bit := '1';
    signal Z: bit_vector(3 downto 0);
begin
    FS0: CounterD_UD port map(UD,CLK,CLEAR,PRESET,EN,Z);
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
        wait for 180 ns;
        UD<='0';
        wait;
    end process;
end arch;