library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
library std;
use std.textio.all;
library IEEE;
use IEEE.numeric_bit.all;

entity lcd is
    port(
        clk,reset,rs,rw : in bit;
        dataIn : in bit_vector(7 downto 0);
        rsOut,rwOut,en : out bit;
        dataOut : out bit_vector(7 downto 0)
    );
end lcd;

architecture arch of lcd is
    file fout : TEXT open WRITE_MODE is "output.txt";
    signal state : integer range 1 to 5 := 1;
begin
    en <= clk;
    init : process(state,rs,rw,dataIn)
    variable current_line : line;
    begin
        case(state) is 
        when 1 =>
            rsOut <= '0';
            rwOut <= '0';
            dataOut <= x"01";
            write(current_line, string'("instr(0x01);"));
        when 2 =>
            rsOut <= '0';
            rwOut <= '0';
            dataOut <= x"38";
            write(current_line, string'("instr(0x38);"));
        when 3 =>
            rsOut <= '0';
            rwOut <= '0';
            dataOut <= x"0F";
            write(current_line, string'("instr(0x0F);"));
        when 4 =>
            rsOut <= '0';
            rwOut <= '0';
            dataOut <= x"06";
            write(current_line, string'("instr(0x06);"));
        when 5 =>
            rsOut <= rs;
            rwOut <= rw;
            dataOut <= dataIn;
            if rs = '0' then
                write(current_line, string'("instr("));
            else 
                write(current_line, string'("data("));
            end if;
            write(current_line, TO_INTEGER(unsigned(dataIn)));
            write(current_line, string'(");"));
        end case;
        writeLine(fout,current_line);
    end process;

    clkP : process(clk)
    begin
        if clk'event and clk='0' then
            if state < 5 then
                state <= state + 1;
            elsif reset = '0' then
                state <= 1;
            end if;
        end if;
    end process;

end arch;
--ghdl -a --ieee=synopsys  LCD.vhdl && ghdl -e --ieee=synopsys  LCD