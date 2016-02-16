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
-- File name          : STD_04200_bad.vhd
-- File Creation date : 2015-04-08
-- Project name       : VHDL Handbook CNES Edition 
-------------------------------------------------------------------------------------------------
-- Softwares             :  Microsoft Windows (Windows 7) - Editor (Eclipse + VEditor)
-------------------------------------------------------------------------------------------------
-- Description : Handbook example: Clock domain crossing handshake based: bad example
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
entity STD_04200_bad is
   generic (g_Width : integer range 1 to 256 := 4);
   port  (
      i_ClockA : in std_logic;                              -- First clock signal
      i_ClockB : in std_logic;                              -- Second clock signal
      i_Data   : in std_logic_vector(g_Width-1 downto 0);   -- Data from source domain (synced on i_ClockA)
      o_Data   : out std_logic_vector(g_Width-1 downto 0)   -- Data to destination domain (synced on i_ClockB)
   );
end STD_04200_bad;

architecture Behavioral of STD_04200_bad is
   signal Data : std_logic_vector(g_Width-1 downto 0);      -- Module output
begin
   P_Crossing:process(i_ClockA)
   begin
      if (rising_edge(i_ClockA)) then
         Data <= i_Data;
      end if;
   end process;
   
   o_Data <= Data;
end Behavioral;
--CODE