-------------------------------------------------------------------------------------------------
-- Company   : CNES
-- Author    : Mickael Carl (CNES)
-- Copyright : Copyright (c) CNES.
-- Licensing : GNU GPLv3
-------------------------------------------------------------------------------------------------
-- Version         : V1
-- Version history :
--    V1 : 2015-04-20 : Mickael Carl (CNES): Creation
-------------------------------------------------------------------------------------------------
-- File name          : STD_06200_good.vhd
-- File Creation date : 2015-04-20
-- Project name       : VHDL Handbook CNES Edition
-------------------------------------------------------------------------------------------------
-- Softwares             :  Microsoft Windows (Windows 7) - Editor (Eclipse + VEditor)
-------------------------------------------------------------------------------------------------
-- Description : Handbook example: Management of numeric values: good example
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
entity STD_06200_good is
   port (
      i_D1  : in  std_logic;
      i_D2  : in  std_logic;
      i_D3  : in  std_logic;
      i_D4  : in  std_logic;
      i_Sel : in  std_logic_vector(1 downto 0);
      o_Q   : out std_logic
      );
end STD_06200_good;

architecture Behavioral of STD_06200_good is
   constant c_Sel_D1 : std_logic_vector(1 downto 0) := "00";
   constant c_Sel_D2 : std_logic_vector(1 downto 0) := "01";
   constant c_Sel_D3 : std_logic_vector(1 downto 0) := "10";
   constant c_Sel_D4 : std_logic_vector(1 downto 0) := "11";
begin
   o_Q <= i_D1 when i_Sel = c_Sel_D1
          else i_D2 when i_Sel = c_Sel_D2
          else i_D3 when i_Sel = c_Sel_D3
          else i_D4;
end Behavioral;
--CODE
