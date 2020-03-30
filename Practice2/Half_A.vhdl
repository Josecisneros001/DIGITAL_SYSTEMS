entity Half_A is
    port(
        S: in bit_vector(1 downto 0);
        Z: out bit_vector(1 downto 0)
    );
end entity;

architecture arch of Half_A is
    component Multiplexor4_1 is 
        port(
            A: in bit_vector(3 downto 0);
            S: in bit_vector(1 downto 0);
            Z: out bit
        );
    end component;
    signal A0: bit_vector(3 downto 0);
    signal A1: bit_vector(3 downto 0);
begin
    A0<="0110";
    A1<="1000";
    MS0 : Multiplexor4_1 port map (A0,S,Z(0));
    MS1 : Multiplexor4_1 port map (A1,S,Z(1));
end arch;