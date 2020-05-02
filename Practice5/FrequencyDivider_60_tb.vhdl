entity FrequencyDivider_60_tb is
end FrequencyDivider_60_tb;
 
architecture arch of FrequencyDivider_60_tb is
    component FrequencyDivider_60 is
        port(
            CLK: in bit;
            Z: out bit
            );
    end component;
    signal CLK: bit := '0';
    signal Z: bit;
begin
    FS0: FrequencyDivider_60 port map(CLK,Z);
    CLK_process : process
    begin
        wait for 1 ns;
        CLK<='0';
        wait for 1 ns;
        CLK<='1';
    end process;
end arch;
