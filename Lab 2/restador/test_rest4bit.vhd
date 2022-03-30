library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test_rest4bit is
end test_rest4bit;

architecture Behavorial of test_rest4bit is

	COMPONENT rest4bit
		port (
			X,Y: in std_logic_vector(3 downto 0);
			Bin1: in std_logic;
			B: out std_logic;
			R01: out std_logic_vector(3 downto 0));
	END COMPONENT;
	
	signal X,Y: std_logic_vector(3 downto 0) := (others => '0');
	signal Bin1: std_logic := '0';
	signal B: std_logic;
	signal R01: std_logic_vector(3 downto 0);
	

BEGIN

uut: rest4bit port map (
    X => X,
    Y => Y,
    Bin1 => Bin1,
    B => B,
    R01 => R01
    );

process 
    begin
        X <= "1010";
        Y <= "1001";
        Bin1 <= '0';

        wait for 20 ns;
        X <= "1010";
        Y <= "1000";
        Bin1 <= '0';
        wait for 20 ns;

        X <= "1010";
        Y <= "1010";
        Bin1 <= '1';
        wait for 20 ns;

        X <= "0110";
        Y <= "1100";
        Bin1 <= '1';
        wait for 20 ns;
        wait;
end process;

end;