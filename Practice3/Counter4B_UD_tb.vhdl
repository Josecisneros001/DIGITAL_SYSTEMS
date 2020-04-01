entity Counter4B_UD_tb is
end Counter4B_UD_tb;
 
architecture arch of Counter4B_UD_tb is
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
    signal UD: bit  := '1';
    signal CLK: bit := '0';
    signal CLEAR: bit_vector(3 downto 0) := "1111";
    signal PRESET: bit_vector(3 downto 0) := "1111";
    signal EN: bit := '1';
    signal Z: bit_vector(3 downto 0);
begin
    FS0: Counter4B_UD port map(UD,CLK,CLEAR,PRESET,EN,Z);
    CLK_process : process
    begin
        CLK<='0';
        wait for 5 ns;
        CLK<='1';
        wait for 5 ns;
    end process;

    Set_process : process
    begin
        CLEAR<="0000";
        wait for 5 ns;
        CLEAR<="1111";
        wait for 50 ns;
        UD<='0';
        wait for 50 ns;
        UD<='1';
        wait;
    end process;
end arch;