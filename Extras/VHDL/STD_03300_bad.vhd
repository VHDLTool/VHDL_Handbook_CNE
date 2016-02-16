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
-- File name          : STD_03300_bad.vhd
-- File Creation date : 2015-04-13
-- Project name       : VHDL Handbook CNES Edition
-------------------------------------------------------------------------------------------------
-- Softwares             :  Microsoft Windows (Windows 7) - Editor (Eclipse + VEditor)
-------------------------------------------------------------------------------------------------
-- Description : Handbook example: Buffer port type: bad example
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
entity STD_03300_bad is
   port (
      i_Clock   : in     std_logic;                     -- Clock input
      i_Reset_n : in     std_logic;                     -- Reset input
      i_A       : in     std_logic_vector(3 downto 0);  -- Data to add
      o_B       : buffer std_logic_vector(3 downto 0)   -- Data output
      );
end STD_03300_bad;

architecture Behavioral of STD_03300_bad is
begin
   -- Adding the input to the output at each clock cycle, reading from the output
   P_Add : process(i_Reset_n, i_Clock)
   begin
      if (i_Reset_n = '0') then
         o_B <= (others => '0');
      else
         if (rising_edge(i_Clock)) then
            o_B <= std_logic_vector(unsigned(i_A) + unsigned(o_B));
         end if;
      end if;
   end process;
end Behavioral;
--CODE
