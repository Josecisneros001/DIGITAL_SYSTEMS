entity FF_JK is
    port(
        CLK,J,K,PRESET,CLEAR,EN: in bit;
        Q,Qn: out bit
        );
end entity;
 
architecture arch of FF_JK is
    signal intQ: bit;
begin
    Q<=intQ;
    Qn<=not intQ;
    process(CLK,PRESET,CLEAR)
        begin

        if CLEAR='0' then
            intQ<='0';
        elsif PRESET='0' then
            intQ<='1';
        elsif EN='0' then
            null;
        elsif CLK'event and CLK='1' then
            if J = '0' and K = '0' then
                intQ <= intQ;
            elsif J = '0' and K = '1' then
                intQ <= '0';
            elsif J = '1' and K = '0' then
                intQ <= '1';
            else
                intQ <= not intQ;
            end if;
        end if;
    end process;
end arch;