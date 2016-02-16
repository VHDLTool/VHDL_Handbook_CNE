-------------------------------------------------------------------------------------------------
-- Company   : CNES
-- Author    : Mickael Carl (CNES)
-- Copyright : Copyright (c) CNES. 
-- Licensing : GNU GPLv3
-------------------------------------------------------------------------------------------------
-- Version         : V1
-- Version history : 
--    V1 : 2015-04-13 : Mickael Carl (CNES): Creation
-------------------------------------------------------------------------------------------------
-- File name          : STD_03500_good.vhd
-- File Creation date : 2015-04-13
-- Project name       : VHDL Handbook CNES Edition 
-------------------------------------------------------------------------------------------------
-- Softwares             :  Microsoft Windows (Windows 7) - Editor (Eclipse + VEditor)
-------------------------------------------------------------------------------------------------
-- Description : Handbook example: Record type for top level entity ports: good example
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

library Work;
use Work.pkg_HBK.all;

--CODE
-- This entity is at the top level of the design
entity STD_03500_good is
   port  (
      i_Sel   : in std_logic;                               -- Select input
      i_Data0 : in std_logic_vector(pkg_Width-1 downto 0);  -- First data input
      i_Data1 : in std_logic_vector(pkg_Width-1 downto 0);  -- Second data input
      o_Data  : out std_logic_vector(pkg_Width-1 downto 0)  -- Mux data output
   );
end STD_03500_good;

architecture Behavioral of STD_03500_good is
   signal Record_Signal : pkg_Mux_Record;
begin
   -- We map the top level inputs to the record, and then map the record on a component
   Record_Signal.Data0 <= i_Data0;
   Record_Signal.Data1 <= i_Data1;
   Record_Signal.Sel   <= i_Sel;
   
   -- Mux taking a record as its input. Output depends on select value
   Mux_Record:Mux_With_Record
   port map (
      i_Record => Record_Signal,
      o_Data => o_Data
   );
end Behavioral;
--CODE