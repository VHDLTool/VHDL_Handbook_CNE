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
-- File name          : STD_04900_good.vhd
-- File Creation date : 2015-04-07
-- Project name       : VHDL Handbook CNES Edition
-------------------------------------------------------------------------------------------------
-- Softwares             :  Microsoft Windows (Windows 7) - Editor (Eclipse + VEditor)
-------------------------------------------------------------------------------------------------
-- Description : Handbook example: Edge detection best practice: good example
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
-- My_Sig_re: Rising edge detection of My_Signal
-- My_Sig_fe: Falling edge detection of My_Signal
-- My_Signal_rX: X times registered My_Signal signal
--
-- P_Process_Name: Process
--
-------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity STD_04900_good is
   port (
      i_Reset_n : in  std_logic;        -- Reset signal
      i_Clock   : in  std_logic;        -- Clock signal
      i_A       : in  std_logic;        -- Signal on which detect edges
      o_A_re    : out std_logic;        -- Rising edge of A
      o_A_fe    : out std_logic;        -- Falling edge of A
      o_A_ae    : out std_logic         -- Any edge of A
      );
end STD_04900_good;

architecture Behavioral of STD_04900_good is
   signal A_r1 : std_logic;             -- i_A registered 1 time
   signal A_r2 : std_logic;             -- i_A registered 2 times
begin
   --CODE
   -- Registration process to be able to detect edges of signal A
   P_Registration : process(i_Reset_n, i_Clock)
   begin
      if (i_Reset_n = '0') then
         A_r1 <= '0';
         A_r2 <= '0';
      else
         if (rising_edge(i_Clock)) then
            A_r1 <= i_A;
            A_r2 <= A_r1;
         end if;
      end if;
   end process;

-- Assign the outputs of the module:
   o_A_re <= A_r1 and not A_r2;
   o_A_fe <= not A_r1 and A_r2;
   o_A_ae <= A_r1 xor A_r2;
end Behavioral;
--CODE
