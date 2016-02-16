-------------------------------------------------------------------------------------------------
-- Company   : CNES
-- Author    : Mickael Carl (CNES)
-- Copyright : Copyright (c) CNES.
-- Licensing : GNU GPLv3
-------------------------------------------------------------------------------------------------
-- Version         : V1
-- Version history :
--    V1 : 2015-04-08 : Mickael Carl (CNES): Creation
-------------------------------------------------------------------------------------------------
-- File name          : STD_03700_good.vhd
-- File Creation date : 2015-04-08
-- Project name       : VHDL Handbook CNES Edition
-------------------------------------------------------------------------------------------------
-- Softwares             :  Microsoft Windows (Windows 7) - Editor (Eclipse + VEditor)
-------------------------------------------------------------------------------------------------
-- Description : Handbook example: Reset assertion and deassertion: good example
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
entity STD_03700_good is
   port (
      i_Clock         : in  std_logic;  -- Clock signal
      i_Reset_Input_n : in  std_logic;  -- Reset input
      o_Main_Reset_n  : out std_logic   -- Global reset signal active low
      );
end STD_03700_good;

architecture Behavioral of STD_03700_good is
   signal Main_Reset_n   : std_logic;   -- Internal signal between FlipFlops
   signal Main_Reset_n_r : std_logic;   -- Assertion block output
begin
   P_Reset_Assert : process(i_Reset_Input_n, i_Clock)
   begin
      if (i_Reset_Input_n = '0') then
         Main_Reset_n   <= '0';         -- Output reset signal is active low
         Main_Reset_n_r <= '0';
      else
         if rising_edge(i_Clock) then
            Main_Reset_n   <= '1';  -- Reset is deasserted. Since it is active low, the inactive value is 1
            Main_Reset_n_r <= Main_Reset_n;
         end if;
      end if;
   end process;

   o_Main_Reset_n <= Main_Reset_n_r;
end Behavioral;
--CODE
