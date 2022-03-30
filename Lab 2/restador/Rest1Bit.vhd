library IEEE;
use IEEE.std_logic_1164.all;

entity rest1bit is 
	port(
	X0, Y0, Bin: in std_logic;
	R0, B0: out std_logic);
end rest1bit;


architecture Behavorial of rest1bit is 

begin
	R0 <= (not(X0) and not(Y0) and Bin) or (not(X0) and Y0 and not(Bin)) or (X0 and not(Y0) and not(Bin)) or (X0 and Y0 and Bin);
	B0 <= (not(X0) and Bin) or (not(X0) and Y0) or (Y0 and Bin);

end Behavorial;