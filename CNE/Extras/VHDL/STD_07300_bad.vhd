-------------------------------------------------------------------------------------------------
-- Company   : CNES
-- Author    : Mickael Carl (CNES)
-- Copyright : Copyright (c) CNES. 
-- Licensing : GNU GPLv3
-------------------------------------------------------------------------------------------------
-- Version         : V1
-- Version history : 
--    V1 : 2015-04-09 : Mickael Carl (CNES): Creation
-------------------------------------------------------------------------------------------------
-- File name          : STD_07300_bad.vhd
-- File Creation date : 2015-04-09
-- Project name       : VHDL Handbook CNES Edition 
-------------------------------------------------------------------------------------------------
-- Softwares             :  Microsoft Windows (Windows 7) - Editor (Eclipse + VEditor)
-------------------------------------------------------------------------------------------------
-- Description : Handbook example: Use of wait statement in testbenches: bad example
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

entity STD_07300_bad is
end STD_07300_bad;

architecture Simulation of STD_07300_bad is
   -- All signals for tested modules inputs/outputs
   signal Clock      : std_logic := '0';
   signal Reset_n    : std_logic;
   signal D_Signal   : std_logic;
   signal Q_Signal   : std_logic;
   
   signal State   : integer   := 0;
   -- Used to stop simulation when no more stimulus are present
   signal End_Sim    : std_logic;
   
   component DFlipFlop
   port (
      i_Clock     : in std_logic;   -- Clock signal
      i_Reset_n   : in std_logic;   -- Reset signal
      i_D         : in std_logic;   -- D Flip-Flop input signal
      o_Q         : out std_logic;  -- D Flip-Flop output signal
      o_Q_n       : out std_logic   -- D Flip-Flop output signal, inverted
   );
   end component;
begin
   -- The D Flip-Flop to test
   T_DFlipFlop: DFlipFlop
   port map (
      i_Clock     => Clock,
      i_Reset_n   => Reset_n,
      i_D         => D_Signal,
      o_Q         => Q_Signal,
      o_Q_n       => open
   );
   
   -- Clock process
   P_Clock:process
   begin
      if (End_Sim/='1') then
         Clock <= not Clock after 5 ns;
      end if;
   end process;
   
   --CODE
   -- Test process
   P_Test:process(Clock)
   begin
      if (rising_edge(Clock)) then
         if (State=1) then
            Reset_n <= '0';
         elsif (State=2) then
            Reset_n <= '1';
            D <= '1';
         elsif (State=3) then
            D <= '0';
         else
            End_Simu <= '1';
            -- Or if your simulator supports VHDL-2008 :
            -- finish(2);
         end if;
         State <= State + 1;
      end if;
   end process;
   --CODE
end Simulation;