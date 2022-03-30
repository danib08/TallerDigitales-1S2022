library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testlab2 is
end testlab2;

architecture Behavorial of testlab2 is

	COMPONENT lab2
		port (
			Xn,Yn: in std_logic_vector(3 downto 0);
			Binn: in std_logic;
			an, bn, cn, dn, en, fn, gn: out std_logic);
	END COMPONENT;
	
	signal Xn, Yn: std_logic_vector(3 downto 0) := (others => '0');
	signal Binn: std_logic := '0';
	signal an, bn, cn, dn, en, fn, gn: std_logic;
	

BEGIN

uut: lab2 port map (
    Xn => Xn,
	 Yn => Yn,
    Binn => Binn,
    an => an,
    bn => bn,
    cn => cn,
	 dn => dn,
	 en => en,
    fn => fn,
    gn => gn
    );

process 
    begin
        Xn <= "1100";
        Yn <= "0101"; 
        Binn <= '0';
        wait for 20 ps;
		  
        Xn <= "1000";
		  Yn <= "1011";
        Binn <= '1';
        wait for 20 ps;

        Xn <= "1110";
        Yn <= "1111";
		  Binn <= '0';
        wait for 20 ps;

        Xn <= "1001";
        Yn <= "0101";
		  Binn <= '1';
        wait for 20 ps;
        wait;
end process;

end;