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
-- File name          : CNE_01900_bad.vhd
-- File Creation date : 2015-04-14
-- Project name       : VHDL Handbook CNES Edition 
-------------------------------------------------------------------------------------------------
-- Softwares             :  Microsoft Windows (Windows 7) - Editor (Eclipse + VEditor)
-------------------------------------------------------------------------------------------------
-- Description : Handbook example: Identification of registered signals: bad example
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
entity CNE_01900_bad is
   port  (
      i_Reset_n   : in std_logic;   -- Reset signal
      i_Clock     : in std_logic;   -- Clock signal
      i_D         : in std_logic;   -- Signal on which detect edges
      o_D_re      : out std_logic   -- Rising edge of i_D
   );
end CNE_01900_bad;

architecture Behavioral of CNE_01900_bad is
   signal D_clocked   : std_logic; -- i_D registered 1 time
   signal D_clocked2  : std_logic; -- i_D registered 2 times
begin
   -- Rising edge detection process
   P_detection: process(i_Reset_n, i_Clock)
   begin
      if (i_Reset_n='0') then
         D_clocked <= '0';
         D_clocked2 <= '0';
      elsif (rising_edge(i_Clock)) then
            D_clocked <= i_D;
            D_clocked2 <= D_clocked;
      end if;
   end process;
   
   o_D_re <= D_clocked and not D_clocked2;
end Behavioral;
--CODE