-------------------------------------------------------------------------------------------------
-- Company   : CNES
-- Author    : Mickael Carl (CNES)
-- Copyright : Copyright (c) CNES.
-- Licensing : GNU GPLv3
-------------------------------------------------------------------------------------------------
-- Version         : V1
-- Version history :
--    V1 : 2015-04-13 : Mickael Carl (CNES): Creation
-------------------------------------------------------------------------------------------------
-- File name          : STD_01600_good.vhd
-- File Creation date : 2015-04-13
-- Project name       : VHDL Handbook CNES Edition
-------------------------------------------------------------------------------------------------
-- Softwares             :  Microsoft Windows (Windows 7) - Editor (Eclipse + VEditor)
-------------------------------------------------------------------------------------------------
-- Description : Handbook example: Entity port sort: good example
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

library work;
use work.pkg_HBK.all;

--CODE
entity STD_01600_good is
   -- We sort port by interfaces, with special ports first
   port (
      -- Special signals:
      i_Clock   : in  std_logic;        -- Clock input
      i_Reset_n : in  std_logic;        -- Reset input
      -- First Mux:
      i_A1      : in  std_logic;        -- first input
      i_B1      : in  std_logic;        -- second input
      i_Sel1    : in  std_logic;        -- select input
      o_Q1      : out std_logic;        -- Mux output
      -- Second Mux:
      i_A2      : in  std_logic;        -- first input
      i_B2      : in  std_logic;        -- second input
      i_Sel2    : in  std_logic;        -- select input
      o_Q2      : out std_logic         -- Mux output
      );
end STD_01600_good;
--CODE

architecture Behavioral of STD_01600_good is
   signal Q1      : std_logic;          -- First module output
   signal Q2      : std_logic;          -- Second module output
   signal OutMux1 : std_logic;          -- First Mux output
   signal OutMux2 : std_logic;          -- Second Mux output
begin
   -- First Mux, output to be synced
   Mux1 : Mux
      port map (
         i_A => i_A1,
         i_B => i_B1,
         i_S => i_Sel1,
         o_O => OutMux1
         );

   -- Second Mux, output to be synced
   Mux2 : Mux
      port map (
         i_A => i_A2,
         i_B => i_B2,
         i_S => i_Sel2,
         o_O => OutMux2
         );

   -- Synchronizes the Mux outputs
   P_SyncMux : process(i_Reset_n, i_Clock)
   begin
      if (i_Reset_n = '0') then
         Q1 <= '0';
         Q2 <= '0';
      else
         if (rising_edge(i_Clock)) then
            Q1 <= OutMux1;
            Q2 <= OutMux2;
         end if;
      end if;
   end process;

   o_Q1 <= Q1;
   o_Q2 <= Q2;
end Behavioral;
