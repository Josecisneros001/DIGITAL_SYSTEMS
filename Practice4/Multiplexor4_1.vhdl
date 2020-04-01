entity Multiplexor4_1 is
    port(
        A: in bit_vector(3 downto 0);
        S: in bit_vector(1 downto 0);
        Z: out bit
    );
end entity;

architecture arch of Multiplexor4_1 is
signal notS: bit_vector(1 downto 0);
signal temp: bit_vector(3 downto 0);
begin
    notS(0)<= not S(0);
    notS(1)<= not S(1);
    temp(0)<=(A(0) and notS(0) and notS(1));
    temp(1)<=(A(1) and notS(1) and S(0));
    temp(2)<=(A(2) and notS(0) and S(1));
    temp(3)<=(A(3) and S(0) and S(1));
    Z<= (temp(0) or temp(1) or temp(2) or temp(3)); 
end arch;