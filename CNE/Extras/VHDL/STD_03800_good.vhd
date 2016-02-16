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
-- File name          : STD_03800_good.vhd
-- File Creation date : 2015-04-07
-- Project name       : VHDL Handbook CNES Edition
-------------------------------------------------------------------------------------------------
-- Softwares             :  Microsoft Windows (Windows 7) - Editor (Eclipse + VEditor)
-------------------------------------------------------------------------------------------------
-- Description : Handbook example: Synchronous elements initialization: good example
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

entity STD_03800_good is
   port (
      i_Clock   : in  std_logic;        -- Clock signal
      i_Reset_n : in  std_logic;        -- Reset signal
      i_D       : in  std_logic;        -- D Flip-Flop input signal
      o_Q       : out std_logic;        -- D Flip-Flop output signal
      o_Q_n     : out std_logic         -- D Flip-Flop output signal, inverted
      );
end STD_03800_good;

--CODE
architecture Behavioral of STD_03800_good is
   signal Q   : std_logic;              -- D Flip-Flop output
   signal Q_n : std_logic;              -- Same as Q, inverted
begin
   -- D FlipFlop process
   P_FlipFlop : process(i_Clock, i_Reset_n)
   begin
      if (i_Reset_n = '0') then
         Q   <= '0';
         Q_n <= '1';
      else
         if (rising_edge(i_Clock)) then
            Q   <= i_D;
            Q_n <= not i_D;
         end if;
      end if;
   end process;

   o_Q   <= Q;
   o_Q_n <= Q_n;
end Behavioral;
--CODE
