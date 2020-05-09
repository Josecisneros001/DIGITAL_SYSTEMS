entity Counter0_59_tb is
end Counter0_59_tb;
 
architecture arch of Counter0_59_tb is
    component Counter0_59 is
        port(
            CLK: in bit;
            CLEAR: in bit;
            PRESET: in bit;
            EN: in bit;
            RCO : out bit;
            NCLK: out bit;
            Z: out bit_vector(7 downto 0)
            );
    end component;
    signal CLK: bit := '0';
    signal CLEAR: bit := '1';
    signal PRESET: bit := '1';
    signal EN: bit := '1';
    signal RCO: bit := '1';
    signal NCLK: bit := '1';
    signal Z: bit_vector(7 downto 0);
begin
    FS0: Counter0_59 port map(CLK,CLEAR,PRESET,EN,RCO,NCLK,Z);
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