 
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity keyboard_v1 is 
    port(
        kbd_clk, kbd_data, clk : in std_logic;
        reset, enable : in std_logic;
        scan_code : out std_logic_vector(7 downto 0);
        scan_ready : out std_logic;
        scan_error : out std_logic
    );
end entity;

architecture arch of keyboard_v1 is

    signal filter : std_logic_vector(7 downto 0) := "00000000";
    signal kbd_clk_filtered : std_logic := '0';
    signal read_char : std_logic := '0';
    signal ready_set : std_logic := '0';
    signal parity_pred : std_logic := '0';
    signal incount : unsigned(3 downto 0) := "0000";
    signal shiftin : std_logic_vector(8 downto 0) := "000000000";

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
   
    -- Lectura de la información serial del dispositivo
    process
    begin
        wait until (kbd_clk_filtered'event and kbd_clk_filtered = '0');
        if reset = '1' then
            incount <= "0000";
            read_char <= '0';
            parity_pred <= '1';
        else
            if kbd_data = '0' and read_char = '0' then
                read_char <= '1';
                ready_set <= '0';
                parity_pred <= '1';
            else
                if read_char = '1' then
                    if incount < "1001" then
                        if kbd_data = '1' and incount < "1000" then
                            parity_pred <= not parity_pred;
                        end if;
                        
                        incount <= incount + 1;
                        shiftin(7 downto 0) <= shiftin(8 downto 1);
                        shiftin(8) <= kbd_data;
                        ready_set <= '0';
                    
                    else
                        if shiftin(8) = parity_pred then
                            scan_error <= '0';
                        else
                            scan_error <= '1';
                        end if;
                        scan_code <= shiftin(7 downto 0);
                        read_char <= '0';
                        ready_set <= '1';
                        incount <= "0000";
                    end if;
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