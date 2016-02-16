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
-- File name          : STD_05100_good.vhd
-- File Creation date : 2015-04-07
-- Project name       : VHDL Handbook CNES Edition
-------------------------------------------------------------------------------------------------
-- Softwares             :  Microsoft Windows (Windows 7) - Editor (Eclipse + VEditor)
-------------------------------------------------------------------------------------------------
-- Description : Handbook example: Metastability management: good example
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
entity STD_05100_good is
   port (
      i_Reset : in  std_logic;          -- Reset signal
      i_Clock : in  std_logic;          -- Clock signal
      i_A     : in  std_logic;          -- Some async signal
      o_A     : out std_logic           -- Synchronized signal
      );
end STD_05100_good;

architecture Behavioral of STD_05100_good is
   signal A_r  : std_logic;             -- Used to synchronize i_A
   signal A_r2 : std_logic;             -- Module output
begin
   -- Double registration of signal A to synchronize it and avoid metastability
   P_Register2 : process(i_Reset, i_Clock)
   begin
      if (i_Reset = '1') then
         A_r  <= '0';
         A_r2 <= '0';
      else
         if (rising_edge(i_Clock)) then
            A_r  <= i_A;
            A_r2 <= A_r;
         end if;
      end if;
   end process;

   o_A <= A_r2;
end Behavioral;
--CODE
