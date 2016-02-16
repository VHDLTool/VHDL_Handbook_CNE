-------------------------------------------------------------------------------------------------
-- Company   : CNES
-- Author    : Mickael Carl (CNES)
-- Copyright : Copyright (c) CNES.
-- Licensing : GNU GPLv3
-------------------------------------------------------------------------------------------------
-- Version         : V1
-- Version history :
--    V1 : 2015-04-10 : Mickael Carl (CNES): Creation
-------------------------------------------------------------------------------------------------
-- File name          : STD_05900_good.vhd
-- File Creation date : 2015-04-10
-- Project name       : VHDL Handbook CNES Edition
-------------------------------------------------------------------------------------------------
-- Softwares             :  Microsoft Windows (Windows 7) - Editor (Eclipse + VEditor)
-------------------------------------------------------------------------------------------------
-- Description : Handbook example: Range for integers: good example
--
-- Limitations : This file is an example of the VHDL handbook made by CNES. It is a stub aimed at
--               demonstrating good practices in VHDL and as such, its design is minimalistic.
--               It is provided as is, without any warranty.
--               This example is compliant with the Handbook version 1.
--
-------------------------------------------------------------------------------------------------
-- Naming conventions:
--
-- i_Port: Input entity port
-- o_Port: Output entity port
-- b_Port: Bidirectional entity port
-- g_My_Generic: Generic entity port
--
-- c_My_Constant: Constant definition
-- t_My_Type: Custom type definition
--
-- My_Signal_n: Active low signal
-- v_My_Variable: Variable
-- sm_My_Signal: FSM signal
-- pkg_Param: Element Param coming from a package
--
-- My_Signal_re: Rising edge detection of My_Signal
-- My_Signal_fe: Falling edge detection of My_Signal
-- My_Signal_rX: X times registered My_Signal signal
--
-- P_Process_Name: Process
--
-------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
--CODE
entity STD_05900_good is
   port (
      i_Clock   : in  std_logic;        -- Main clock signal
      i_Reset_n : in  std_logic;        -- Main reset signal
      i_Enable  : in  std_logic;        -- Enables the counter
      i_Length  : in  std_logic_vector(7 downto 0);  -- Unsigned Value for Counter Period
      o_Count   : out std_logic_vector(7 downto 0)  -- Counter (unsigned value)
      );
end STD_05900_good;

architecture Behavioral of STD_05900_good is
   signal Count        : integer range 0 to 255;  -- Counter output signal
   signal Count_Length : integer range 0 to 255;  -- Length input signal
begin
--CODE
   Count_Length <= to_integer(unsigned(i_Length));

   -- Will count undefinitely from 0 to i_Length while i_Enable is asserted
   P_Count : process(i_Reset_n, i_Clock)
   begin
      if (i_Reset_n = '0') then
         Count <= 0;
      else
         if (rising_edge(i_Clock)) then
            if (Count >= Count_Length) then  -- Counter restarts from 0
               Count <= 0;
            elsif (i_Enable = '1') then      -- Increment counter value
               Count <= Count + 1;
            end if;
         end if;
      end if;
   end process;

   o_Count <= std_logic_vector(to_unsigned(Count, o_Count'length));

end Behavioral;
