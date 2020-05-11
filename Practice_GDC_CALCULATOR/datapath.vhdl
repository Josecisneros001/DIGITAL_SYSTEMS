library ieee;
use ieee.std_logic_1164.all;

entity datapath is
    port(
        x,y : in std_logic_vector(3 downto 0);
        x_sel,y_sel : in std_logic;
        clk : in std_logic;
        x_load,y_load,x_reset,y_reset : in std_logic;
        x_sub,y_sub : in std_logic;
        o_enb,o_reset : in std_logic;
        x_gt_y, x_eq_y, x_lt_y : out std_logic;
        z : out std_logic_vector(3 downto 0)
    );
end datapath;

architecture arch of datapath is
    component mux is
        port(
            x,y : in std_logic_vector(3 downto 0);
            sel : in std_logic;
            res : out std_logic_vector(3 downto 0)
        );
    end component;
    component register4bits is 
    port(
        d_in : in std_logic_vector(3 downto 0);
        clk, ld , reset : in std_logic;
        d_out : out std_logic_vector(3 downto 0)
    );
    end component;
    component substractor4bits is
        port(
            en     : in std_logic; 
            a, b   : in std_logic_vector(3 downto 0);
            d  : out std_logic_vector(3 downto 0)
        );
    end component;
    component comparator is
        port(
            x, y : in std_logic_vector(3 downto 0);
            x_gt_y, x_eq_y, x_lt_y : out std_logic
        );
    end component;
    signal xNew,yNew : std_logic_vector(3 downto 0) := "0000";
    signal inRx,inRy : std_logic_vector(3 downto 0) := "0000";
    signal outRx,outRy : std_logic_vector(3 downto 0) := "0000";
begin
    MUXx : mux port map(x,xNew,x_sel,inRx);
    MUXy : mux port map(y,yNew,y_sel,inRy);
    REGx : register4bits port map(inRx,clk,x_load,x_reset,outRx);
    REGy : register4bits port map(inRy,clk,y_load,y_reset,outRy);
    Cxy  : comparator port map(outRx,outRy, x_gt_y, x_eq_y, x_lt_y); 
    SUBx  : substractor4bits port map(x_sub,outRx,outRy,xNew);
    SUBy  : substractor4bits port map(y_sub,outRy,outRx,yNew);
    OUTR : register4bits port map(outRx,clk,o_enb,o_reset,z);
end arch;