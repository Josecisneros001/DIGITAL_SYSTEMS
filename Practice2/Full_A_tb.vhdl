entity Full_A_tb is
end entity;

architecture arch of Full_A_tb is
    component Full_A is 
        port(
            S: in bit_vector(1 downto 0);
            Cin: in bit;
            Z: out bit_vector(1 downto 0)
        );
    end component;
    signal S: bit_vector(1 downto 0);
    signal Cin: bit;
    signal Z: bit_vector(1 downto 0);
begin
    FAS0 : Full_A port map (S,Cin,Z);
    process
    begin
        S<="01";
        Cin<='1';
        wait for 5 ns;
        S<="10";
        Cin<='1';
        wait for 5 ns;
        S<="00";
        Cin<='1';
        wait for 5 ns;
        wait;
    end process;
end arch;