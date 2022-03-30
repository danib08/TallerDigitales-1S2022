library IEEE;
use IEEE.std_logic_1164.all;

entity lab2 is 
	port(
	Xn,Yn: in std_logic_vector(3 downto 0);
	Binn: in std_logic;
	an, bn, cn, dn, en, fn, gn, Bout: out std_logic);
	
end lab2;

architecture Behavioral of lab2 is

	component rest4bit is
		Port (
			X,Y: in std_logic_vector(3 downto 0);
			Bin1: in std_logic;
			B: out std_logic;
			R01: out std_logic_vector(3 downto 0));
	end component;
	
	component decorest is
		Port (
			A: in std_logic_vector(3 downto 0);
			Bi: in std_logic;
			ax, b, c, d, e, f, g, Bo: out std_logic);
	end component;

	
signal RESTA: std_logic_vector(3 downto 0);
signal Bx: std_logic;

begin
	RS : rest4bit port map(
		X => Xn,
		Y => Yn,
		Bin1 => Binn,
		B => Bx,    -- borrow out
		R01 => RESTA);
		
	DC : decorest port map(
		A => RESTA,
		Bi => Bx,
		ax => an,
		b => bn,
		c => cn,
		d => dn,
		e => en,
		f => fn,
		g => gn,
		Bo => Bout);

		
end Behavioral;