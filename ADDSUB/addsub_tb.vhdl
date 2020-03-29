library ieee;
use ieee.std_logic_1164.all;

entity addsub_tb is 
end addsub_tb;

architecture arch of addsub_tb is
    component addsub is 
        port(
            A,B: in std_logic_vector(7 downto 0);
            T: in std_logic;
            OV_FLAG, C_FLAG : out std_logic;
            R: out std_logic_vector(7 downto 0)
        );
    end component;
    signal A,B: std_logic_vector(7 downto 0);
    signal T: std_logic;
    signal OV_FLAG, C_FLAG : std_logic;
    signal R: std_logic_vector(7 downto 0);
begin
    FS0 : addsub port map (A,B,T,OV_FLAG,C_FLAG,R);
    process
    begin
        --SUMA POSITIVO/POSITIVO
        T<='0';
        A<="00001111";
        B<="00001111";
        wait for 5 ns;
        A<="00000001";
        B<="00001111";
        wait for 5 ns;
        --SUMA POSITIVO/NEGATIVO
        A<="00011111";
        B<="10001111";
        wait for 5 ns;
        A<="00000001";
        B<="11111111";
        wait for 5 ns;
        --SUMA NEGATIVO/POSITIVO
        A<="10001111";
        B<="00011111";
        wait for 5 ns;
        A<="11111111";
        B<="00000001";
        wait for 5 ns;
        --SUMA OVERFLOW
        A<="01111111";
        B<="00000001";
        wait for 5 ns;
        A<="11111111";
        B<="10000000";
        wait for 5 ns;
        --RESTA OVERFLOW
        T<='1';
        A<="01111111";
        B<="11111111";
        wait for 5 ns;
        A<="10000000";
        B<="00000001";
        wait for 5 ns;
        --SUMA COUT
        T<='0';
        A<="11111111";
        B<="10000001";
        wait for 5 ns;
        A<="10001000";
        B<="10001000";
        wait for 5 ns;
        --RESTA COUT
        T<='1';
        A<="11111111";
        B<="00000001";
        wait for 5 ns;
        A<="10001000";
        B<="00000001";
        wait for 5 ns;
        wait; 
        
    end process; 
end arch;
