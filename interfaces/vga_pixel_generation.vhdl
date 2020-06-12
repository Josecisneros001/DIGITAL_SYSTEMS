library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga_pixel_generation is
    port(
        clk         : in std_logic;
        pixel_x     : in integer;
        pixel_y     : in integer;
        video_on    : in std_logic;
        rgbIn       : in std_logic_vector(2 downto 0);
        rgbOut      : out std_logic_vector(2 downto 0)
    );
end entity;

architecture arch of vga_pixel_generation is
begin

    process 
    begin 
        wait until clk'event and clk = '1';
        
        rgbOut <= rgbIn and video_on & video_on & video_on;
        
    end process;

end arch;