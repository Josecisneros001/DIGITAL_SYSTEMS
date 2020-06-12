library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga is
    generic(
        h_pulse     : integer;
        h_bp        : integer;
        h_display   : integer;
        h_fp        : integer;
        h_pol       : std_logic;
        v_pulse     : integer;
        v_bp        : integer;
        v_display   : integer;
        v_fp        : integer;
        v_pol       : std_logic
    );
    port(
        clk         : in std_logic;
        rgbIn       : in std_logic_vector(2 downto 0);
        h_sync      : out std_logic;
        v_sync      : out std_logic;
        rgbOut      : out std_logic_vector(2 downto 0)
    );
end entity;

architecture arch of vga is
    component vga_pixel_generation is
        port(
            clk         : in std_logic;
            pixel_x     : in integer;
            pixel_y     : in integer;
            video_on    : in std_logic;
            rgbIn       : in std_logic_vector(2 downto 0);
            rgbOut      : out std_logic_vector(2 downto 0)
        );
    end component;
    component vga_sync is
        generic(
            h_pulse     : integer;
            h_bp        : integer;
            h_display   : integer;
            h_fp        : integer;
            h_pol       : std_logic;
            v_pulse     : integer;
            v_bp        : integer;
            v_display   : integer;
            v_fp        : integer;
            v_pol       : std_logic
        );
        port(
            clk         : in std_logic;
            enable      : out std_logic;
            column      : out integer;
            row         : out integer;
            h_sync      : out std_logic;
            v_sync      : out std_logic;
            clk_vga     : out std_logic;
            video_on    : out std_logic
        );
    end component;
    signal enable      : std_logic  := '0';
    signal column      : integer    :=  0 ;
    signal row         : integer    :=  0 ;
    signal clk_vga     : std_logic  := '0';
    signal video_on     : std_logic  := '0';
begin
    UUT1 : vga_sync 
        generic map(h_pulse, h_bp, h_display, h_fp, h_pol, v_pulse, v_bp, v_display, v_fp, v_pol)
        port map(clk, enable, column, row, h_sync, v_sync, clk_vga, video_on);
    UUT2 : vga_pixel_generation 
        port map(clk,column,row,video_on,rgbIn,rgbOut);
end arch;