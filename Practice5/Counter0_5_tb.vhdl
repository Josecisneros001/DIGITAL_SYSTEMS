entity Counter0_5_tb is
end Counter0_5_tb;
 
architecture arch of Counter0_5_tb is
    component Counter0_5 is
        port(
            CLK: in bit;
            CLEAR: in bit;
            PRESET: in bit_vector(3 downto 0);
            EN: in bit;
            Z: out bit_vector(3 downto 0)
            );
    end component;
    signal CLK: bit := '0';
    signal CLEAR: bit := '1';
    signal PRESET: bit_vector(3 downto 0) := "1111";
    signal EN: bit := '1';
    signal Z: bit_vector(3 downto 0);
begin
    FS0: Counter0_5 port map(CLK,CLEAR,PRESET,EN,Z);
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
        wait;
    end process;
end arch;