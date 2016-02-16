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
-- File name          : STD_05600_good.vhd
-- File Creation date : 2015-04-13
-- Project name       : VHDL Handbook CNES Edition
-------------------------------------------------------------------------------------------------
-- Softwares             :  Microsoft Windows (Windows 7) - Editor (Eclipse + VEditor)
-------------------------------------------------------------------------------------------------
-- Description : Handbook example: Unsuitability of combinational feedbacks: good example
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
entity STD_05600_good is
   port (
      i_Clock   : in  std_logic;        -- Clock signal
      i_Reset_n : in  std_logic;        -- Reset signal
      i_A       : in  std_logic;        -- First Mux input
      i_B       : in  std_logic;        -- Second Mux input
      i_Sel     : in  std_logic;        -- Mux selector
      o_O       : out std_logic         -- Mux output
      );
end STD_05600_good;

architecture Behavioral of STD_05600_good is
   signal Mux_Sel   : std_logic;        -- Combinational select
   signal Mux_Sel_r : std_logic;        -- Synchronized select
   signal O         : std_logic;        -- Module output
begin
   Mux_Sel <= i_Sel and O;

   -- Synchronizes the Mux_Sel signal to avoid combinational feedback
   DFF : DFlipFlop
      port map (
         i_Clock   => i_Clock,
         i_Reset_n => i_Reset_n,
         i_D       => Mux_Sel,
         o_Q       => Mux_Sel_r
         );

   -- Combinational Mux selecting A or B depending on Mux_Sel_r value
   Mux1 : Mux
      port map (
         i_A => i_A,
         i_B => i_B,
         i_S => Mux_Sel_r,
         o_O => O
         );

   o_O <= O;
end Behavioral;
--CODE
