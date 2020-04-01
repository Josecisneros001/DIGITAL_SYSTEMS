entity decoder7 is
    port(
        S:in bit_vector(3 downto 0);
        Z:out bit_vector(6 downto 0)
    );
end decoder7;

architecture arch of decoder7 is
    signal Ands: bit_vector(9 downto 1);
    signal A,B,C,D:bit;
begin
    A<=S(0);
    B<=S(1);
    C<=S(2);
    D<=S(3);

    Ands(1)<= B and D;
    Ands(2)<= not B and not D;
    Ands(3)<= C and D;
    Ands(4)<= not C and not D;
    Ands(5)<= C and not D;
    Ands(6)<= not B and C;
    Ands(7)<= B and not C and D;
    Ands(8)<= B and not C;
    Ands(9)<= B and not D;

    Z(0)<= A or C or Ands(1) or Ands(2);
    Z(1)<= not B or Ands(4) or Ands(3);
    Z(2)<= B or D or not C;
    Z(3)<= A or Ands(2) or Ands(7) or Ands(5) or Ands(6);
    Z(4)<= Ands(2) or Ands(5);
    Z(5)<= A or Ands(4) or Ands(8) or Ands(9);
    Z(6)<= A or Ands(5) or Ands(8) or Ands(6);

end arch;