entity Counter4B_tb is
end Counter4B_tb;
 
architecture arch of Counter4B_tb is
    component Counter4B is
        port(
            CLK: in bit;     
            CLEAR: in bit;
            PRESET: in bit;
            EN: in bit;
            Z: out bit_vector(3 downto 0)
            );
    end component;
    signal CLK: bit := '0';
    signal CLEAR: bit := '1';
    signal PRESET: bit := '1';
    signal EN: bit := '1';
    signal Z: bit_vector(3 downto 0);
begin
    FS0: Counter4B port map(CLK,CLEAR,PRESET,EN,Z);
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