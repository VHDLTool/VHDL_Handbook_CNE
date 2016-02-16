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
-- File name          : CNE_01400_bad.vhd
-- File Creation date : 2015-04-14
-- Project name       : VHDL Handbook CNES Edition 
-------------------------------------------------------------------------------------------------
-- Softwares             :  Microsoft Windows (Windows 7) - Editor (Eclipse + VEditor)
-------------------------------------------------------------------------------------------------
-- Description : Handbook example: Identification of generic port name: bad example
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
entity CNE_01400_bad is
   generic (Width : positive := 3);
   port  (
      i_D0  : in std_logic_vector(Width downto 0); -- First Mux input
      i_D1  : in std_logic_vector(Width downto 0); -- Second Mux input
      i_Sel : in std_logic;                        -- Mux select input
      o_D   : out std_logic_vector(Width downto 0) -- Mux output
   );
end CNE_01400_bad;
--CODE

architecture Behavioral of CNE_01400_bad is
begin
   -- Simple Mux, output depends on select value
   o_D <= i_D1 when i_Sel='1'
     else i_D0;
end Behavioral;