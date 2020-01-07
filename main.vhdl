library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity main is
    Port ( start : in  STD_LOGIC;
           stop : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           clock : in  STD_LOGIC;
           result : out  STD_LOGIC_VECTOR (6 downto 0));
end main;

architecture Behavioral of main is

signal counter : std_logic_vector (6 downto 0) := "0000000";
constant clock_period : time := 500 ms; -- cause we want count like a clock, every a second
constant max_count : integer := 99      -- count till this value

type state_type is (s0,s1,s2);          -- s0: stop state, s1: counting 
signal ps,ns : state_type:=s0;          -- starting state (present state/next state)

begin

process(clock)
begin
  if (rising_edge(clock)) then
    ps <= ns;                                   -- update present state
    case ps is 
      when s0 =>
        if (start = '1') then 
          counter <= counter + "0000001";
          result <= counter;
          ns <= s1;
        end if;
        if (stop = '1') then 
          result <= counter;
          ns <= ps;
        end if;
        if (reset = '1') then
          result <= counter;
          ns <= ps;
        end if;
      when s1 => 
        if (start = '1') then 
          counter <= counter + "0000001";
          result <= counter;
          ns <= ps;
        end if;
        if (stop = '1') then 
          result <= counter;
          ns <= s2;
        end if;
        if (reset = '1') then 
          counter <= "0000000";
          result <= counter;
          ns <= s0;
        end if;
      when s2 =>
        if (start = '1') then 
          counter <= counter + "0000001";
          result <= counter;
          ns <= s1;
        end if;
        if (stop = '1') then 
          result <= counter;
          ns <= ps;
        end if;
        if (reset = '1') then 
          counter <= "0000000";
          result <= counter;
          ns <= s0;
        end if;
      when others =>
        null;
    end case;

	 if (counter >= max_count) then            -- check max value rto counting
	  counter <= "0000000";
	 end if;
	 
  end if;
end process;

end Behavioral;
