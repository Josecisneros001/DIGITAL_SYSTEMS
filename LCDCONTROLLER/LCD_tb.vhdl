library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
library std;
use std.textio.all;

entity LCD_tb is
end LCD_tb;

architecture arch of LCD_tb is
    component lcd is
        port(
            clk,reset,rs,rw : in bit;
            dataIn : in bit_vector(7 downto 0);
            rsOut,rwOut,en : out bit;
            dataOut : out bit_vector(7 downto 0)
        );
    end component;
    signal clk,reset,rs,rw : bit := '0';
    signal dataIn : bit_vector(7 downto 0);
    signal rsOut,rwOut,en : bit;
    signal dataOut : bit_vector(7 downto 0);
begin
    F0: LCD port map(clk,reset,rs,rw,dataIn,rsOut,rwOut,en,dataOut);
    stimulus : process
        file fin : TEXT open READ_MODE is "input.txt";
        variable current_read_line : line;
        variable field_rs : bit;
        variable field_rw : bit;
        variable field_dataIn : bit_vector(7 downto 0);
        variable field_reset : bit;
    begin
        reset <= '1';
        wait for 15 ns;
        readline(fin,current_read_line);
        while (not endfile(fin)) loop
            readline(fin,current_read_line);
            read(current_read_line, field_rs);
            read(current_read_line, field_rw);
            read(current_read_line, field_dataIn);
            read(current_read_line, field_reset);
            rs <= field_rs;
            rw <= field_rw;
            dataIn <= field_dataIn;
            reset <= field_reset;
            wait for 5 ns;
        end loop ; 
        wait;
    end process;

    clkP : process
    begin
        clk <= not clk;
        wait for 2.5 ns;
    end process;

end arch;
--ghdl -a --ieee=synopsys  LCD_tb.vhdl && ghdl -e --ieee=synopsys  LCD_tb