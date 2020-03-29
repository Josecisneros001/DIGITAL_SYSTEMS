library ieee;
use ieee.std_logic_1164.all;

entity addsub is
    port(
        A,B: in std_logic_vector(7 downto 0);
        T: in std_logic;
        OV_FLAG, C_FLAG : out std_logic;
        R: out std_logic_vector(7 downto 0)
    );
end entity addsub;

architecture arch of addsub is
    component Full_A
        port(
            A,B,Cin: in std_logic;
            Cout,S : out std_logic
        );
    end component;
signal B_T: std_logic_vector(7 downto 0);
signal C_O: std_logic_vector(7 downto 0);
begin
    B_T(0) <= B(0) xor T;
    B_T(1) <= B(1) xor T;
    B_T(2) <= B(2) xor T;
    B_T(3) <= B(3) xor T;
    B_T(4) <= B(4) xor T;
    B_T(5) <= B(5) xor T;
    B_T(6) <= B(6) xor T;
    B_T(7) <= B(7) xor T;
    FS0: FULL_A port map (A=>A(0),B=>B_T(0),Cin=> T,     Cout=>C_O(0),S=>R(0));
    FS1: FULL_A port map (A=>A(1),B=>B_T(1),Cin=> C_O(0),Cout=>C_O(1),S=>R(1));
    FS2: FULL_A port map (A=>A(2),B=>B_T(2),Cin=> C_O(1),Cout=>C_O(2),S=>R(2));
    FS3: FULL_A port map (A=>A(3),B=>B_T(3),Cin=> C_O(2),Cout=>C_O(3),S=>R(3));
    FS4: FULL_A port map (A=>A(4),B=>B_T(4),Cin=> C_O(3),Cout=>C_O(4),S=>R(4));
    FS5: FULL_A port map (A=>A(5),B=>B_T(5),Cin=> C_O(4),Cout=>C_O(5),S=>R(5));
    FS6: FULL_A port map (A=>A(6),B=>B_T(6),Cin=> C_O(5),Cout=>C_O(6),S=>R(6));
    FS7: FULL_A port map (A=>A(7),B=>B_T(7),Cin=> C_O(6),Cout=>C_O(7),S=>R(7));
    C_FLAG  <=C_O(7);
    OV_FLAG <=C_O(7) xor C_O(6);
end arch;
