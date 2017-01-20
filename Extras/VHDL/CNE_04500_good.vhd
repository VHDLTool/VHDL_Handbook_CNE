 -------------------------------------------------------------------------------------------------
-- Company   : CNES
-- Author    : Mickael Carl (CNES)
-- Copyright : Copyright (c) CNES. 
-- Licensing : GNU GPLv3
-------------------------------------------------------------------------------------------------
-- Version         : V1
-- Version history : 
--    V1 : 2015-04-17 : Mickael Carl (CNES): Creation
-------------------------------------------------------------------------------------------------
-- File name          : CNE_04900_good.vhd
-- File Creation date : 2015-04-17
-- Project name       : VHDL Handbook CNES Edition 
-------------------------------------------------------------------------------------------------
-- Softwares             :  Microsoft Windows (Windows 7) - Editor (Eclipse + VEditor)
-------------------------------------------------------------------------------------------------
-- Description : Handbook example: Reset registers: good example
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
entity CNE_04500_good is
   generic (
      g_Width : positive := 4
   );
   port  (
      i_Clock : in std_logic;
      i_Reset_n : in std_logic;
      i_Data : in std_logic_vector(g_Width-1 downto 0);
      o_Sum : out std_logic_vector(g_Width downto 0)
   );
end CNE_04500_good;

architecture Behavioral of CNE_04500_good is
   type Data_4_Reg is array (0 to 3) of std_logic_vector(g_Width-1 downto 0);
   signal Data_Reg : Data_4_Reg;
   signal Sum : std_logic_vector(g_Width downto 0);
   signal Sum_r : std_logic_vector(g_Width downto 0);
begin
   p_Reg:process(i_Reset_n,i_Clock)
   begin
      if (i_Reset_n='0') then
         Data_Reg <= (others => (others => '0'));
      elsif (rising_edge(i_Clock)) then
            Data_Reg(3) <= Data_Reg(2);
            Data_Reg(2) <= Data_Reg(1);
            Data_Reg(1) <= Data_Reg(0);
            Data_Reg(0) <= i_Data;
      end if;
   end process;
   
   Sum <= std_logic_vector(unsigned('0' & Data_Reg(3)) + unsigned('0' & Data_Reg(2)));
   
   p_Reg_Uninitialized:process(i_Reset_n,i_Clock)
   begin
      if (i_Reset_n='0') then
         Sum_r <= (others => '0');
      elsif (rising_edge(i_Clock)) then
            Sum_r <= Sum;
      end if;
   end process;
   
   o_Sum <= Sum_r;
end Behavioral;
--CODE