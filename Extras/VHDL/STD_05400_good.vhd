-------------------------------------------------------------------------------------------------
-- Company   : CNES
-- Author    : Mickael Carl (CNES)
-- Copyright : Copyright (c) CNES. 
-- Licensing : GNU GPLv3
-------------------------------------------------------------------------------------------------
-- Version         : V1
-- Version history : 
--    V1 : 2015-04-10 : Mickael Carl (CNES): Creation
-------------------------------------------------------------------------------------------------
-- File name          : STD_05400_good.vhd
-- File Creation date : 2015-04-10
-- Project name       : VHDL Handbook CNES Edition 
-------------------------------------------------------------------------------------------------
-- Softwares             :  Microsoft Windows (Windows 7) - Editor (Eclipse + VEditor)
-------------------------------------------------------------------------------------------------
-- Description : Handbook example: Unsuitability of internal tristate: good example
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
entity STD_05400_good is
   port  (
      i_A   : in std_logic_vector(3 downto 0);  -- Input data of tristate block
      i_Sel : in std_logic_vector(3 downto 0);  -- Mux select
      o_B   : out std_logic                     -- Single module output
   );
end STD_05400_good;

architecture Behavioral of STD_05400_good is
   signal B : std_logic;   -- Module output
begin
   -- Simple Mux asynchronous process, output depends on Mux select
   P_Mux:process(i_A, i_Sel)
   begin
      if (i_Sel="00") then
         B <= i_A(0);
      elsif (i_Sel="01") then
         B <= i_A(1);
      elsif (i_Sel="10") then
         B <= i_A(2);
      else
         B <= i_A(3);
      end if;
   end process;
   
   o_B <= B;
end Behavioral;
--CODE