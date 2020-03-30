entity Multiplexor4_1_tb is
end entity;

architecture arch of Multiplexor4_1_tb is
    component Multiplexor4_1 is
        port(
            A: in bit_vector(3 downto 0);
            S: in bit_vector(1 downto 0);
            Z: out bit
        );
    end component;
    signal A: bit_vector(3 downto 0);
    signal S: bit_vector(1 downto 0);
    signal Z: bit;
begin
    M41: Multiplexor4_1 port map(A,S,Z);
    process
    begin
        A<="1110";
        S<="00";
        wait for 5 ns;
        A<="0001";
        S<="00";
        wait for 5 ns;
        A<="0010";
        S<="01";
        wait for 5 ns;
        A<="1000";
        S<="11";
        wait for 5 ns;
        A<="0111";
        S<="11";
        wait for 5 ns;
        A<="1000";
        S<="11";
        wait for 5 ns;
        wait;
    end process;
    
end arch;