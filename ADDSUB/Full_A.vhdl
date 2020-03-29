library ieee;
use ieee.std_logic_1164.all;

entity Full_A is
    port(
        A,B,Cin: in std_logic;
        Cout,S : out std_logic
    );
end entity Full_A;

architecture arch of Full_A is
signal D,E,F: std_logic;
begin
    D<= A xor B;
    E<= Cin and D;
    F<= A and B;
    S<= Cin xor D;
    Cout <= E or F;
end arch;