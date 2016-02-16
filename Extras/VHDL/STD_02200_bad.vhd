--CODE
-------------------------------------------------------------------------------------------------
-- Author: Mickael Carl
-- Date: 2015-04-02
-------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
--CODE

entity STD_02200_bad is
   port (
      i_Clock   : in  std_logic;        -- Clock signal
      i_Reset_n : in  std_logic;        -- Reset signal
      i_D       : in  std_logic;        -- D Flip-Flop input signal
      o_Q       : out std_logic         -- D Flip-Flop output signal
      );
end STD_02200_bad;

architecture Behavioral of STD_02200_bad is
   signal Q : std_logic;                -- D Flip-Flop output
begin
   -- D FlipFlop process
   P_FlipFlop : process(i_Clock, i_Reset_n)
   begin
      if (i_Reset_n = '0') then
         Q <= '0';
      else
         if (rising_edge(i_Clock)) then
            Q <= i_D;
         end if;
      end if;
   end process;

   o_Q <= Q;
end Behavioral;
