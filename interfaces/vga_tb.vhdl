library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga_tb is
    constant h_pulse     : integer := 96;
    constant h_bp        : integer := 48;
    constant h_display   : integer := 640;
    constant h_fp        : integer := 16;
    constant h_pol       : std_logic := '0';
    constant v_pulse     : integer := 2;
    constant v_bp        : integer := 33;
    constant v_display   : integer := 640;
    constant v_fp        : integer := 10;
    constant v_pol       : std_logic := '0';  
    constant period      : time := 40 ps;  
end entity;

architecture arch of vga_tb is
    component vga is
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
    end component;
    signal clk         : std_logic  := '0';
    signal rgbIn       : std_logic_vector(2 downto 0);
    signal h_sync      : std_logic;
    signal v_sync      : std_logic;
    signal rgbOut      : std_logic_vector(2 downto 0);
begin
    UUT : vga 
        generic map(h_pulse, h_bp, h_display, h_fp, h_pol, v_pulse, v_bp, v_display, v_fp, v_pol)
        port map(clk, rgbIn, h_sync, v_sync, rgbOut);
    
    process
    begin
        clk <= '0'; wait for period / 2;
        clk <= '1'; wait for period / 2;
    end process;
    
    rgbIn <= "111";
    
end arch;
