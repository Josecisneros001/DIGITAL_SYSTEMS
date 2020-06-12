library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

library std;
use std.textio.all;


entity keyboard_v2_tb is
    constant period : time := 40 ns ; -- Señal de reloj de 25MHz
    constant bit_period : time := 60 us ; -- Keyboard clock ~ 16.7 Khz max
end entity;

architecture arch of keyboard_v2_tb is
    component keyboard_v2 is 
        port(
            kbd_clk, kbd_data, clk : in std_logic;
            reset, enable : in std_logic;
            scan_code : out std_logic_vector(7 downto 0);
            scan_parity : out std_logic;
            scan_ready : out std_logic;
            scan_error : out std_logic
        );
    end component;

    signal clk : std_logic := '0';
    signal reset : std_logic;
    signal kbd_clk : std_logic := '1';
    signal kbd_data : std_logic := 'H';
    signal enable : std_logic := '0';
    signal scan_ready : std_logic := '0';
    signal scan_error : std_logic;
    signal scan_code : std_logic_vector(7 downto 0);
    signal scan_parity : std_logic;

    type dataRecord is record
        code : std_logic_vector(7 downto 0);
        parity : std_logic;
    end record;
 
    type dataArray is array (natural range <>) of dataRecord;
    constant data : dataArray := (
                                    (code => x"3B", parity => '0'),
                                    (code => x"44", parity => '1'),
                                    (code => x"21", parity => '0'), 
                                    (code => x"24", parity => '1')
                                );

    begin 

    UUT : keyboard_v2 port map (kbd_clk, kbd_data, clk, reset, enable, scan_code, scan_parity, scan_ready, scan_error );

    -- Señal de reloj del sistema
    clk <= not clk after (period / 2);
    reset <= '1', '0' after period;

    process
        procedure send_code( sc : dataRecord ) is
        begin
            kbd_clk <= 'H';
            kbd_data <= 'H';
            
            wait for (bit_period/2);
            kbd_data <= '0'; -- Start bit
            
            wait for (bit_period/2);
            kbd_clk <= '0';
            wait for (bit_period/2);
            kbd_clk <= '1';

            for i in 0 to 7 loop
                kbd_data <= sc.code(i);
                
                wait for (bit_period/2);
                kbd_clk <= '0';
                wait for (bit_period/2);
                kbd_clk <= '1';

            end loop;

            -- bit de paridad
            kbd_data <= sc.parity;
            
            wait for (bit_period/2);
            kbd_clk <= '0';
            wait for (bit_period/2);
            kbd_clk <= '1';
            
            -- stop bit
            kbd_data <= '1';
            
            wait for (bit_period/2);
            kbd_clk <= '0';
            wait for (bit_period/2);
            kbd_clk <= '1';
            
            kbd_data <= 'H';
            
            wait for (bit_period * 3);
        end procedure send_code;
    
       begin
        wait for bit_period;
        for i in data'range loop
            send_code(data(i));
        end loop;
        wait;
    end process;

    process
        variable l : line;
    begin
        wait until scan_ready'event and scan_ready = '1';
        
        if scan_error = '1' then
            write (l, string'("Unsuccessful Scan : "));
        else
            write (l, string'("Successful Scan   : "));
        end if;
        
        write (l, string'("Code->"));
        write (l, scan_code);
        write (l, string'(", Parity->"));
        write (l, scan_parity);

        writeline(output, l);
        
    end process;

end arch;