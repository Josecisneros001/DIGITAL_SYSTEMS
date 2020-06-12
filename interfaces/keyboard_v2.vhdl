 
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity keyboard_v2 is 
    port(
        kbd_clk, kbd_data, clk : in std_logic;
        reset, enable : in std_logic;
        scan_code : out std_logic_vector(7 downto 0);
        scan_parity : out std_logic;
        scan_ready : out std_logic;
        scan_error : out std_logic
    );
end entity;

architecture arch of keyboard_v2 is

    signal filter : std_logic_vector(7 downto 0) := "00000000";
    signal kbd_clk_filtered : std_logic := '0';
    signal ready_set : std_logic;
    signal parity_pred : std_logic := '1';
    signal incount : unsigned(3 downto 0) := "0000";
    signal shiftin : std_logic_vector(8 downto 0) := "000000000";
    signal state : integer range 0 to 11 := 0;
begin
   
    clk_filter : process
    begin
        wait until clk'event and clk = '1';
        filter(6 downto 0) <= filter(7 downto 1);
        filter(7) <= kbd_clk;
        if filter = x"FF" then 
            kbd_clk_filtered <= '1';
        elsif filter = x"00" then
            kbd_clk_filtered <= '0';
        end if;
    end process;

    process(state)
    begin
        case( state ) is
            when 0 =>
                parity_pred <= '1';
            when 1 =>
                scan_error <= '0';
                ready_set <= '0';
            when 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 =>
                if kbd_data = '1' then
                    parity_pred <= not parity_pred;
                end if;
                shiftin(7 downto 0) <= shiftin(8 downto 1);
                shiftin(8) <= kbd_data;
            when 10 =>
                shiftin(7 downto 0) <= shiftin(8 downto 1);
                shiftin(8) <= kbd_data;
            when 11 =>
            if shiftin(8) = parity_pred then
                scan_error <= '0';
                else
                scan_error <= '1';
                end if;
                
                scan_parity <= parity_pred;
                scan_code <= shiftin(7 downto 0);
                parity_pred <= '1';
                ready_set <= '1';
        end case ;
    end process;

    process(kbd_clk_filtered)
    begin
        if kbd_clk_filtered'event and kbd_clk_filtered = '0' then
            if reset = '1' then
                state <= 0;
            else
                if state = 11 then
                    state <= 1;
                else 
                    state <= state + 1;
                end if;
            end if;
        end if;
    end process;

    process (enable, ready_set)
    begin
        if enable = '1' then
            scan_ready <= '0';
        elsif ready_set'event then
            scan_ready <= ready_set;
        end if;
    end process;
end arch;