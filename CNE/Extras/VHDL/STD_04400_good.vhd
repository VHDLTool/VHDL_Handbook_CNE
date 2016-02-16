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
-- File name          : STD_04400_good.vhd
-- File Creation date : 2015-04-08
-- Project name       : VHDL Handbook CNES Edition 
-------------------------------------------------------------------------------------------------
-- Softwares             :  Microsoft Windows (Windows 7) - Editor (Eclipse + VEditor)
-------------------------------------------------------------------------------------------------
-- Description : Handbook example: Clock management module: good example
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
entity STD_04400_good is
   port  (
      i_Clock     : in std_logic;   -- Main clock signal
      i_Reset_n   : in std_logic;   -- Main reset signal
      -- A clock domain:
      i_DataA     : in std_logic;   -- Input data for A clock domain
      o_DataA     : out std_logic;  -- Output data in A clock domain
      -- B clock domain:
      i_DataB     : in std_logic;   -- Input data for B clock domain
      o_DataB     : out std_logic   -- Output data in B clock domain
   );
end STD_04400_good;

architecture Behavioral of STD_04400_good is
   component CMM
   -- Generates slower clocks from its input one
   port (
      i_Clock     : in std_logic;   -- Input clock
      i_Reset_n   : in std_logic;   -- Reset signal
      o_ClockA    : out std_logic;  -- First output clock
      o_ClockB    : out std_logic   -- Second output clock
   );
   end component;

   signal ClockA  : std_logic;      -- Clock A internal signal
   signal ClockB  : std_logic;      -- Clock B internal signal
begin
   FlipFlopA:DFlipFlop
   port map (
      i_Clock     => ClockA,
      i_Reset_n   => i_Reset_n,
      i_D         => i_DataA,
      o_Q         => o_DataA,
      o_Q_n       => open
   );
   
   FlipFlopB:DFlipFlop
   port map (
      i_Clock     => ClockB,
      i_Reset_n   => i_Reset_n,
      i_D         => i_DataB,
      o_Q         => o_DataB,
      o_Q_n       => open
   );
   
   CMM1:CMM
   port map (
      i_Clock     => i_Clock,
      i_Reset_n   => i_Reset_n,
      o_ClockA    => ClockA,
      o_ClockB    => ClockB
   );
end Behavioral;
--CODE