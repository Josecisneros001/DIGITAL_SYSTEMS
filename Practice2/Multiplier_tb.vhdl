entity Multiplier_tb is
end entity;

architecture arch of Multiplier_tb is
    component Multiplier is
        port(
            A: in bit_vector(3 downto 0);
            B: in bit_vector(3 downto 0);
            Z: out bit_vector(7 downto 0)
        );
    end component;
    
    signal A: bit_vector(3 downto 0);
    signal B: bit_vector(3 downto 0);
    signal Z: bit_vector(7 downto 0);
begin
    MP0 : Multiplier port map (A,B,Z);
    process
    begin
            A<="0001";
            B<="0001";
            wait for 5 ns;
            A<="1111";
            B<="0011";
            wait for 5 ns;
            A<="0111";
            B<="0011";
            wait for 5 ns;
            wait;
    end process;
end arch;