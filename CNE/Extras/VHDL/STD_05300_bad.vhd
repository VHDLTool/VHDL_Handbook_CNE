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
-- File name          : STD_05300_bad.vhd
-- File Creation date : 2015-04-07
-- Project name       : VHDL Handbook CNES Edition
-------------------------------------------------------------------------------------------------
-- Softwares             :  Microsoft Windows (Windows 7) - Editor (Eclipse + VEditor)
-------------------------------------------------------------------------------------------------
-- Description : Handbook example: Sensitivity list for combinational processes: bad example
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

entity STD_05300_bad is
   port (
      i_A : in  std_logic;              -- First Mux input
      i_B : in  std_logic;              -- Second Mux input
      i_S : in  std_logic;              -- Mux selector
      o_O : out std_logic               -- Mux output
      );
end STD_05300_bad;

architecture Behavioral of STD_05300_bad is
   signal O : std_logic;                -- Mux output
begin
--CODE
   -- Simple Mux asynchronous process (with incomplete sensitivity list)
   P_Mux : process(i_S)
   begin
      if (i_S = '1') then
         O <= i_B;
      else
         O <= i_A;
      end if;
   end process;

   o_O <= O;
--CODE
end Behavioral;
