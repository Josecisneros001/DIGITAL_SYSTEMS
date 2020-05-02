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
            Z: out bit_vector(7 downto 0);
            E: out bit_vector(3 downto 0)
        );
    end component;
    signal CLK: bit;
    signal CLEAR: bit :='1';
    signal A: bit_vector(15 downto 0);
    signal D: bit_vector(3 downto 0);
    signal Z: bit_vector(7 downto 0);
    signal E: bit_vector(3 downto 0);
    
begin
    FS0: controller port map(CLK,CLEAR,A,D,Z,E);
    
    CLK_process : process
    begin
        wait for 5 ns;
        CLK<='0';
        wait for 5 ns;
        CLK<='1';
    end process;

    Set_process : process
    begin
        A<="1000000000000001";
        D<="0000";
        wait for 80 ns;
        A<="0010000110001001";
        D<="0010";
        wait for 40 ns;
        wait;
    end process;
    
end arch;