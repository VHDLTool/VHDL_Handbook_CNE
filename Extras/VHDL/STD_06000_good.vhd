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
-- File name          : STD_06000_good.vhd
-- File Creation date : 2015-04-13
-- Project name       : VHDL Handbook CNES Edition
-------------------------------------------------------------------------------------------------
-- Softwares             :  Microsoft Windows (Windows 7) - Editor (Eclipse + VEditor)
-------------------------------------------------------------------------------------------------
-- Description : Handbook example: Range direction for arrays: good example
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

entity STD_06000_good is
   generic(
      g_Data_Width      : positive := 4;
      g_Pipeline_Length : positive := 4
      );
   port (
      i_Reset_n : in  std_logic;        -- Reset signal
      i_Clock   : in  std_logic;        -- Clock signal
      i_Data    : in  std_logic_vector(g_Data_Width-1 downto 0);  -- Incoming data to write
      o_Data    : out std_logic_vector(g_Data_Width-1 downto 0)   -- Data read
      );
end STD_06000_good;

--CODE
architecture Behavioral of STD_06000_good is
   type t_Pipeline is array (0 to g_Pipeline_Length-1) of std_logic_vector(g_Data_Width-1 downto 0);  -- Array for signal registration
   signal D : t_Pipeline;               -- Actual signal
begin
   P_Register_Bank : process(i_Reset_n, i_Clock)
   begin
      if (i_Reset_n = '0') then
         D <= (others => (others => '0'));
      else
         if (rising_edge(i_Clock)) then
            D(0) <= i_Data;
            for i in 1 to g_Pipeline_Length-1 loop
               D(i) <= D(i-1);
            end loop;
         end if;
      end if;
   end process;

   o_Data <= D(g_Pipeline_Length-1);
end Behavioral;
--CODE
