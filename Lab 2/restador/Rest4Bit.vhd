library IEEE;
use IEEE.std_logic_1164.all;

entity rest4bit is 
	port(
	X,Y: in std_logic_vector(3 downto 0);
	Bin1: in std_logic;
	B: out std_logic;
	R01: out std_logic_vector(3 downto 0));
	
end rest4bit;

architecture Behavioral of rest4bit is

	component rest1bit is
		Port (
			X0, Y0, Bin: in std_logic;
			B0, R0: out std_logic);
	end component;

	
signal C: std_logic_vector(3 downto 1); -- 1 1 1

begin
	RS0 : rest1bit port map(
		X0 => X(0),
		Y0 => Y(0),
		Bin => Bin1,
		B0 => C(1),
		R0 => R01(0));
		
	RS1 : rest1bit port map(
		X0 => X(1),
		Y0 => Y(1),
		Bin => C(1),
		B0 => C(2),
		R0 => R01(1));
		
	RS2 : rest1bit port map(
		X0 => X(2),
		Y0 => Y(2),
		Bin => C(2),
		B0 => C(3),
		R0 => R01(2));		

	RS3 : rest1bit port map(
		X0 => X(3),
		Y0 => Y(3),
		Bin => C(3),
		B0 => B,
		R0 => R01(3));		
		
end Behavioral;