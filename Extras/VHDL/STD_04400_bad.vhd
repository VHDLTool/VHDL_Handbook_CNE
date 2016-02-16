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
-- File name          : STD_04400_bad.vhd
-- File Creation date : 2015-04-08
-- Project name       : VHDL Handbook CNES Edition 
-------------------------------------------------------------------------------------------------
-- Softwares             :  Microsoft Windows (Windows 7) - Editor (Eclipse + VEditor)
-------------------------------------------------------------------------------------------------
-- Description : Handbook example: Clock management module: bad example
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
entity STD_04400_bad is
   port  (
      i_Clock     : in std_logic;   -- Main clock signal
      i_Reset_n   : in std_logic;   -- Main reset signal
      -- A clock domain:
      i_DataA     : in std_logic;   -- Input data for A clock domain
      o_DataA     : out std_logic;  -- Output data in A clock domain
      o_ClockA    : out std_logic;  -- Clock in A domain
      -- B clock domain:
      i_DataB     : in std_logic;   -- Input data for B clock domain
      o_DataB     : out std_logic;  -- Output data in B clock domain
      o_ClockB    : out std_logic   -- Clock in B domain
   );
end STD_04400_bad;

architecture Behavioral of STD_04400_bad is
   component DFlipFlop_With_CMM
   -- Generates a slower clock signal and uses it to synchronize its input
   port (
      i_Clock     : in std_logic;   -- Main clock signal
      i_Reset_n   : in std_logic;   -- Main reset signal
      i_Data      : in std_logic;   -- Data to sync
      o_Data      : out std_logic;  -- Data signal synced
      o_Clock     : out std_logic   -- Generated clock signal
   );
   end component;
   
   -- First module:
   signal DataA   : std_logic;      -- Data output
   signal ClockA  : std_logic;      -- Clock output
   -- Second module:
   signal DataB   : std_logic;      -- Data output
   signal ClockB  : std_logic;      -- Clock output
begin
   FlipFlopA:DFlipFlop_With_CMM
   port map (
      i_Clock     => i_Clock,
      i_Reset_n   => i_Reset_n,
      i_Data      => i_DataA,
      o_Data      => DataA,
      o_Clock     => ClockA
   );
   
   FlipFlopB:DFlipFlop_With_CMM
   port map (
      i_Clock     => i_Clock,
      i_Reset_n   => i_Reset_n,
      i_Data      => i_DataB,
      o_Data      => DataB,
      o_Clock     => ClockB
   );
   
   -- A clock domain outputs:
   o_DataA <= DataA;
   o_ClockA <= ClockA;
   -- B clock domain outputs:
   o_DataB <= DataB;
   o_ClockB <= ClockB;
end Behavioral;
--CODE