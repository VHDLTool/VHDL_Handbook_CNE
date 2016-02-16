-------------------------------------------------------------------------------------------------
-- Company   : CNES
-- Author    : Mickael Carl (CNES)
-- Copyright : Copyright (c) CNES. 
-- Licensing : GNU GPLv3
-------------------------------------------------------------------------------------------------
-- Version         : V1
-- Version history : 
--    V1 : 2015-04-07 : Mickael Carl (CNES): Creation
-------------------------------------------------------------------------------------------------
-- File name          : STD_04900_bad.vhd
-- File Creation date : 2015-04-07
-- Project name       : VHDL Handbook CNES Edition 
-------------------------------------------------------------------------------------------------
-- Softwares             :  Microsoft Windows (Windows 7) - Editor (Eclipse + VEditor)
-------------------------------------------------------------------------------------------------
-- Description : Handbook example: Edge detection best practice: bad example
--
-- Limitations : This file is an example of the VHDL handbook made by CNES. It is a stub aimed at
--               demonstrating good practices in VHDL and as such, its design is minimalistic.
--               It is provided as is, without any warranty.
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
-- A_re: Rising edge detection of My_Signal
-- A_fe: Falling edge detection of My_Signal
-- My_Signal_rX: X times registered My_Signal signal
--
-- P_Process_Name: Process
--
-------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity STD_04900_bad is
   port  (
      i_A         : in std_logic;   -- Signal on which detect edges
      o_A_fe      : out std_logic;  -- Falling edge of A
      o_A_re      : out std_logic;  -- Rising edge of A
      o_A_ae      : out std_logic   -- Any detected edge of A
   );
end STD_04900_bad;

architecture Behavioral of STD_04900_bad is
begin
   --CODE
   -- Assign the outputs of the module:
   o_A_re <= '1' when rising_edge(i_A) else '0';
   o_A_fe <= '1' when falling_edge(i_A) else '0';
   o_A_ae <= '1' when rising_edge(i_A) xor falling_edge(i_A) else '0';
   --CODE
end Behavioral;