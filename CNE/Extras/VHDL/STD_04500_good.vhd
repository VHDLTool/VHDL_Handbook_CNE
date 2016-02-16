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
-- File name          : STD_04500_good.vhd
-- File Creation date : 2015-04-08
-- Project name       : VHDL Handbook CNES Edition
-------------------------------------------------------------------------------------------------
-- Softwares             :  Microsoft Windows (Windows 7) - Editor (Eclipse + VEditor)
-------------------------------------------------------------------------------------------------
-- Description : Handbook example: Clock reassignment: good example
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
use work.pkg_HBK.all;

--CODE
entity STD_04500_good is
   port (
      i_Clock   : in  std_logic;        -- Clock signal
      i_Reset_n : in  std_logic;        -- Reset signal
      -- D Flip-flop 3 stages pipeline
      -- D Flip-Flop A
      i_DA      : in  std_logic;        -- Input signal
      o_QA      : out std_logic;        -- Output signal
      -- D Flip-flop B
      o_QB      : out std_logic;        -- Output signal
      -- D Flip-Flop C
      o_QC      : out std_logic         -- Output signal
      );
end STD_04500_good;

architecture Behavioral of STD_04500_good is
   signal QA : std_logic;
   signal QB : std_logic;
begin
   -- First Flip-Flop
   DFF1 : DFlipFlop
      port map (
         i_Clock   => i_Clock,
         i_Reset_n => i_Reset_n,
         i_D       => i_DA,
         o_Q       => QA,
         o_Q_n     => open
         );

   -- Second Flip-Flop
   DFF2 : DFlipFlop
      port map (
         i_Clock   => i_Clock,
         i_Reset_n => i_Reset_n,
         i_D       => QA,
         o_Q       => QB,
         o_Q_n     => open
         );

   -- Third Flip-Flop
   DFF3 : DFlipFlop
      port map (
         i_Clock   => i_Clock,
         i_Reset_n => i_Reset_n,
         i_D       => QB,
         o_Q       => o_QC,
         o_Q_n     => open
         );

   o_QA <= QA;
   o_QB <= QB;
end Behavioral;
--CODE
