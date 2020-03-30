entity Full_A is
    port(
        S: in bit_vector(1 downto 0);
        Cin: in bit;
        Z: out bit_vector(1 downto 0)
    );
end entity;

architecture arch of Full_A is
    component Multiplexor4_1 is 
        port(
            A: in bit_vector(3 downto 0);
            S: in bit_vector(1 downto 0);
            Z: out bit
        );
    end component;
    signal A0: bit_vector(3 downto 0);
    signal A1: bit_vector(3 downto 0);
    signal notCin: bit;
begin
    notCin<= not Cin;
    A0(0)<=Cin;
    A0(1)<=notCin;
    A0(2)<=notCin;
    A0(3)<=Cin;
    A1(0)<='0';
    A1(1)<=Cin;
    A1(2)<=Cin;
    A1(3)<='1';
    MS0 : Multiplexor4_1 port map (A =>A0,S=>S,Z=> Z(0));
    MS1 : Multiplexor4_1 port map (A =>A1,S=>S,Z=> Z(1));
end arch;