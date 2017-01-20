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
-- File name          : CNE_01000_good.vhd
-- File Creation date : 2015-04-14
-- Project name       : VHDL Handbook CNES Edition 
-------------------------------------------------------------------------------------------------
-- Softwares             :  Microsoft Windows (Windows 7) - Editor (Eclipse + VEditor)
-------------------------------------------------------------------------------------------------
-- Description : Handbook example: Identification of variable name: good example
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

entity CNE_01000_good is
   generic (
      g_Width     : positive := 4                              -- Data Width
   );
   port  (
      i_Clock     : in std_logic;                              -- Clock signal
      i_Reset_n   : in std_logic;                              -- Reset signal
      i_Data      : in std_logic_vector(g_Width-1 downto 0);   -- Data from which to count ones
      o_Nb_One    : out std_logic_vector(g_Width-1 downto 0)   -- Number of ones in i_Data signal
   );
end CNE_01000_good;

architecture Behavioral of CNE_01000_good is
   -- Function to get the number of ones in a signal
   function Get_Ones(data : in std_logic_vector(g_Width-1 downto 0)) return integer is
      -- Number of ones in the input signal
      variable v_Nb_Ones : integer range 0 to g_Width;
   begin
      v_Nb_Ones := 0;
      -- Loop on each signal's bit
      for i in 0 to g_Width-1 loop
         if (data(i)='1') then
            v_Nb_Ones := v_Nb_Ones + 1;
         end if;
      end loop;
      return v_Nb_Ones;
   end function;
   
   -- Module output
   signal Nb_One : std_logic_vector(g_Width-1 downto 0);
begin
   -- Counts the number of ones in a signal and register this count.
   p_Count_Ones:process(i_Reset_n,i_Clock)
   begin
      if (i_Reset_n='0') then
         Nb_One <= (others => '0');
      elsif (rising_edge(i_Clock)) then
            Nb_One <= std_logic_vector(to_unsigned(Get_Ones(i_Data),Nb_One'length));
      end if;
   end process;
   
   o_Nb_One <= Nb_One;
end Behavioral;