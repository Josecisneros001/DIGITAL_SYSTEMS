entity controller_tb is
end controller_tb;

architecture arch of controller_tb is
    component controller is
        port(
            CLK: in bit;
            CLEAR: in bit;
            A: in bit_vector(15 downto 0);
            D: in bit_vector(3 downto 0);
            --DP,G,F,E,D,C,B,A
            Z1: out bit_vector(7 downto 0);
            Z2: out bit_vector(7 downto 0);
            Z3: out bit_vector(7 downto 0);
            Z4: out bit_vector(7 downto 0)
        );
    end component;
    signal CLK: bit;
    signal CLEAR: bit;
    signal A: bit_vector(15 downto 0);
    signal D: bit_vector(3 downto 0);
    signal Z1: bit_vector(7 downto 0);
    signal Z2: bit_vector(7 downto 0);
    signal Z3: bit_vector(7 downto 0);
    signal Z4: bit_vector(7 downto 0);
    
begin
    FS0:controller port map(CLK,CLEAR,A,D,Z1,Z2,Z3,Z4);
    
    CLK_process : process
    begin
        CLK<='0';
        wait for 5 ns;
        CLK<='1';
        wait for 5 ns;
    end process;

    Set_process : process
    begin
        CLEAR<='0';
        wait for 10 ns;
        CLEAR<='1';
        A<="1000000000000001";
        D<="0100";
        wait for 40 ns;
        A<="0010000110001001";
        D<="0010";
        wait for 40 ns;
        wait;
    end process;
    
end arch;