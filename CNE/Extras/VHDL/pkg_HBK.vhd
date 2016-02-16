-------------------------------------------------------------------------------------------------
-- Company   : CNES
-- Author    : Mickael Carl (CNES)
-- Copyright : Copyright (c) CNES.
-- Licensing : GNU GPLv3
-------------------------------------------------------------------------------------------------
-- Version         : V1
-- Version history :
--    V1 : 2015-04-14 : Mickael Carl (CNES): Creation
-------------------------------------------------------------------------------------------------
-- File name          : pkg_HBK.vhd
-- File Creation date : 2015-04-14
-- Project name       : VHDL Handbook CNES Edition
-------------------------------------------------------------------------------------------------
-- Softwares             :  Microsoft Windows (Windows 7) - Editor (Eclipse + VEditor)
-------------------------------------------------------------------------------------------------
-- Description : Handbook example: Package defining common elements used in examples of the handbook
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

package pkg_HBK is
   constant pkg_Width : integer range 1 to 256 := 4;

   type pkg_Mux_record is
   record
      Data0 : std_logic_vector(pkg_Width-1 downto 0);
      Data1 : std_logic_vector(pkg_Width-1 downto 0);
      Sel   : std_logic;
   end record;

   component Mux
      port (
         i_A : in  std_logic;           -- First Mux input
         i_B : in  std_logic;           -- Second Mux input
         i_S : in  std_logic;           -- Mux selector
         o_O : out std_logic            -- Mux output
         );
   end component;

   component Mux_With_Record
      port (
         i_Record : in  pkg_Mux_Record;  -- Record containing datas and select
         o_Data   : out std_logic_vector(pkg_Width-1 downto 0)  -- Mux data output
         );
   end component;

   component DFlipFlop
      port (
         i_Clock   : in  std_logic;     -- Clock signal
         i_Reset_n : in  std_logic;     -- Reset signal
         i_D       : in  std_logic;     -- D Flip-Flop input signal
         o_Q       : out std_logic;     -- D Flip-Flop output signal
         o_Q_n     : out std_logic      -- D Flip-Flop output signal, inverted
         );
   end component;
end package;
