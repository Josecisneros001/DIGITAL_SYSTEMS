entity FF_JK_tb is
end entity;

architecture arch of FF_JK_tb is
    component FF_JK is
        port(
            CLK,J,K,PRESET,CLEAR,EN: in bit;
            Q,Qn: out bit
            );
    end component;
    signal CLK,J,K,PRESET,CLEAR,EN: bit;
    signal Q,Qn: bit;
begin
    FSO: FF_JK port map(CLK,J,K,PRESET,CLEAR,EN,Q,Qn);
    process
    begin
        
    end process;
end arch;