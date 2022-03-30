library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testdeco is
end testdeco;

architecture Behavorial of testdeco is

	COMPONENT decorest
		port (
			A: in std_logic_vector(3 downto 0);
			Bi: in std_logic;
			ax, b, c, d, e, f, g: out std_logic);
	END COMPONENT;
	
	signal A: std_logic_vector(3 downto 0) := (others => '0');
	signal Bi: std_logic := '0';
	signal ax, b, c, d, e, f, g: std_logic;
	

BEGIN

uut: decorest port map (
    A => A,
    Bi => Bi,
    ax => ax,
    b => b,
    c => c,
	 d => d,
	 e => e,
    f => f,
    g => g
    );

process 
    begin
        A <= "1010";
        Bi <= '0';
        wait for 100 ps;
		  
        A <= "0110";
        Bi <= '1';
        wait for 100 ps;

        A <= "1100";
        Bi <= '0';
        wait for 100 ps;

        A <= "1000";
        Bi <= '1';
        wait for 100 ps;
        wait;
end process;

end;