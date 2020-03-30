entity Multiplier is
    port(
        A: in bit_vector(3 downto 0);
        B: in bit_vector(3 downto 0);
        Z: out bit_vector(7 downto 0)
    );
end entity;

architecture arch of Multiplier is
    component Full_A is
        port(
            S: in bit_vector(1 downto 0);
            Cin: in bit;
            Z: out bit_vector(1 downto 0)
        );
    end component;
    component Half_A is
        port(
            S: in bit_vector(1 downto 0);
            Z: out bit_vector(1 downto 0)
        );
    end component;
    signal B0_A: bit_vector(3 downto 0);
    signal B1_A: bit_vector(3 downto 0);
    signal B2_A: bit_vector(3 downto 0);
    signal B3_A: bit_vector(3 downto 0);
    signal Ctmp:bit_vector(11 downto 0);
    signal Ztmp:bit_vector(5 downto 0);
    signal none:bit;
begin
    B0_A(0)<=B(0) and  A(0);    B1_A(0)<=B(1) and  A(0);
    B0_A(1)<=B(0) and  A(1);    B1_A(1)<=B(1) and  A(1);
    B0_A(2)<=B(0) and  A(2);    B1_A(2)<=B(1) and  A(2);
    B0_A(3)<=B(0) nand A(3);    B1_A(3)<=B(1) nand A(3);
    
    
    Z(0)<=B0_A(0);
    
    FS0: Half_A port map(S(0)=>B1_A(0),S(1)=>B0_A(1),             Z(0)=>Z(1),   Z(1)=>Ctmp(0));
    FS1: Full_A port map(S(0)=>B1_A(1),S(1)=>B0_A(2),Cin=>Ctmp(0),Z(0)=>Ztmp(0),Z(1)=>Ctmp(1));
    FS2: Full_A port map(S(0)=>B1_A(2),S(1)=>B0_A(3),Cin=>Ctmp(1),Z(0)=>Ztmp(1),Z(1)=>Ctmp(2));
    FS3: Full_A port map(S(0)=>B1_A(3),S(1)=>'1'    ,Cin=>Ctmp(2),Z(0)=>Ztmp(2),Z(1)=>Ctmp(3));
    
    B2_A(0)<=B(2) and  A(0);
    B2_A(1)<=B(2) and  A(1);
    B2_A(2)<=B(2) and  A(2);
    B2_A(3)<=B(2) nand A(3);
    
    FS4: Half_A port map(S(0)=>B2_A(0),S(1)=>Ztmp(0),             Z(0)=>Z(2),   Z(1)=>Ctmp(4));
    FS5: Full_A port map(S(0)=>B2_A(1),S(1)=>Ztmp(1),Cin=>Ctmp(4),Z(0)=>Ztmp(3),Z(1)=>Ctmp(5));
    FS6: Full_A port map(S(0)=>B2_A(2),S(1)=>Ztmp(2),Cin=>Ctmp(5),Z(0)=>Ztmp(4),Z(1)=>Ctmp(6));
    FS7: Full_A port map(S(0)=>B2_A(3),S(1)=>Ctmp(3),Cin=>Ctmp(6),Z(0)=>Ztmp(5),Z(1)=>Ctmp(7));
    
    B3_A(0)<=B(3) nand A(0);
    B3_A(1)<=B(3) nand A(1);
    B3_A(2)<=B(3) nand A(2);
    B3_A(3)<=B(3) and  A(3);
    
    FS8:  Half_A port map(S(0)=>B3_A(0),S(1)=>Ztmp(3),             Z(0)=>Z(3),Z(1)=>Ctmp(8));
    FS9:  Full_A port map(S(0)=>B3_A(1),S(1)=>Ztmp(4),Cin=>Ctmp(8),Z(0)=>Z(4),Z(1)=>Ctmp(9));
    FS10: Full_A port map(S(0)=>B3_A(2),S(1)=>Ztmp(5),Cin=>Ctmp(9),Z(0)=>Z(5),Z(1)=>Ctmp(10));
    FS11: Full_A port map(S(0)=>B3_A(3),S(1)=>Ctmp(7),Cin=>Ctmp(10),Z(0)=>Z(6),Z(1)=>Ctmp(11));
    FS12: Half_A port map(S(0)=>'1'    ,S(1)=>Ctmp(11),             Z(0)=>Z(7),Z(1)=>none);
    
    
    
end arch;