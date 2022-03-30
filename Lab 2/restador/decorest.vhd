library IEEE;
use IEEE.std_logic_1164.all;

entity decorest is 
	port(
		A: in std_logic_vector(3 downto 0);
		Bi: in std_logic;
		ax, b, c, d, e, f, g, Bo: out std_logic);
end decorest;


architecture Behavorial of decorest is 

begin
	ax <= (not(Bi) and not(A(3)) and not(A(2)) and not(A(1)) and A(0)) or (not(Bi) and not(A(3)) and 
	A(2) and not(A(1)) and not(A(0))) or (not(Bi) and A(3) and not(A(2)) and A(1) and A(0)) or (not(Bi) and A(3) and
	A(2) and not(A(1)) and A(0)) or (Bi and not(A(3)) and not(A(2)) and A(1) and A(0)) or (Bi and not(A(3)) and A(2) and
	not(A(1)) and A(0)) or (Bi and A(3) and A(2) and not(A(1)) and not(A(0))) or (Bi and A(3) and A(2) and 
	A(1) and A(0));
	
	b <= (Bi and not(A(3)) and not(A(1))) or (not(A(3)) and A(2) and not(A(1)) and A(0)) or (not(Bi) and A(2) and
	A(1) and not(A(0))) or (not(Bi) and A(3) and A(1) and A(0)) or (A(3) and not(A(2)) and A(1) and A(0)) or (not(Bi)
	and A(3) and A(2) and not(A(0))) or (Bi and not(A(2)) and A(1) and not(A(0)));	

	c <= (not(A(3)) and not(A(2)) and A(1) and not(A(0))) or (not(Bi) and A(3) and A(2) and not(A(0))) or (not(Bi) 
	and A(3) and A(2) and A(1)) or (A(3) and A(2) and A(1) and not(A(0))) or (Bi and not(A(3)) and not(A(2)) and
	not(A(1))) or (Bi and not(A(3)) and not(A(1)) and not(A(0)));
	
	d <= (not(A(2)) and not(A(1)) and A(0)) or (A(2) and A(1) and A(0)) or (Bi and not(A(3)) and A(2) and A(1)) or (
	not(Bi) and not(A(3)) and A(2) and not(A(1)) and not(A(0))) or (not(Bi) and A(3) and not(A(2)) and A(1) and
	not(A(0))) or (Bi and A(3) and A(2) and not(A(1)) and not(A(0)));
	
	e <= (not(Bi) and not(A(3)) and A(0)) or (Bi and A(3) and A(0)) or (not(Bi) and not(A(2)) and not(A(1)) and
	A(0)) or (not(Bi) and not(A(3)) and A(2) and not(A(1))) or (not(A(3)) and A(2) and A(1) and A(0)) or (Bi 
	and A(3) and A(2) and not(A(1))) or (Bi and not(A(3)) and not(A(2)) and not(A(1)) and not(A(0)));
	
	f <= (not(Bi) and not(A(3)) and not(A(2)) and A(0)) or (not(Bi) and not(A(3)) and not(A(2)) and A(1)) or (
	not(Bi) and not(A(3)) and A(1) and A(0)) or (not(A(3)) and not(A(2)) and A(1) and A(0)) or (A(3) and A(2) 
	and not(A(1)) and A(0)) or (Bi and A(3) and not(A(1)) and A(0)) or (Bi and A(3) and A(2) and A(1)) or (Bi
	and not(A(3)) and not(A(2)) and not(A(1)) and not(A(0)));
	
	g <= (not(Bi) and not(A(3)) and not(A(2)) and not(A(1))) or (not(Bi) and not(A(3)) and A(2) and A(1) and A(0))
	or (not(Bi) and A(3) and A(2) and not(A(1)) and not(A(0))) or (Bi and not(A(3)) and A(2) and not(A(1)) and
	not(A(0))) or (Bi and A(3) and not(A(2)) and not(A(1)) and A(0)) or (Bi and A(3) and A(2) and A(1) and A(0));
	
	Bo <= Bi;


end Behavorial;