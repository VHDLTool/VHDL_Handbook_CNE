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
-- File name          : STD_05700_good.vhd
-- File Creation date : 2015-04-08
-- Project name       : VHDL Handbook CNES Edition
-------------------------------------------------------------------------------------------------
-- Softwares             :  Microsoft Windows (Windows 7) - Editor (Eclipse + VEditor)
-------------------------------------------------------------------------------------------------
-- Description : Handbook example: Unsuitability of gated clocks: good example
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
use work.pkg_HBK.all;

--CODE
entity STD_05700_good is
   port (
      i_Clock       : in  std_logic;    -- Clock signal
      i_Reset_n     : in  std_logic;    -- Reset signal
      i_Enable      : in  std_logic;    -- Enable signal
      i_Data        : in  std_logic;    -- Input data
      o_Data        : out std_logic;    -- Output data
      o_Gated_Clock : out std_logic     -- Gated clock
      );
end STD_05700_good;

architecture Behavioral of STD_05700_good is
   signal Enable_r : std_logic;
   signal Data_r   : std_logic;         -- Data signal registered
   signal Data_r2  : std_logic;         -- Data signal registered twice

begin
   DFF_En : DFlipFlop
      port map (
         i_Clock   => i_Clock,
         i_Reset_n => i_Reset_n,
         i_D       => i_Enable,
         o_Q       => Enable_r,
         o_Q_n     => open
         );
   -- Make the Flip-Flop work when Enable signal is at 1
   -- Enable signal on D Flip-flop
   P_Sync_Data : process(i_Reset_n, i_Clock)
   begin
      if (i_Reset_n = '0') then
         Data_r  <= '0';
         Data_r2 <= '0';
      else
         if (rising_edge(i_Clock)) then
            if (Enable_r = '1') then
               Data_r  <= i_Data;
               Data_r2 <= Data_r;
            end if;
         end if;
      end if;
   end process;

   o_Data <= Data_r2;
end Behavioral;
--CODE
