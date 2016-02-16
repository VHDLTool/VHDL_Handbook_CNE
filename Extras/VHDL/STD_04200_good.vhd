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
-- File name          : STD_04200_good.vhd
-- File Creation date : 2015-04-08
-- Project name       : VHDL Handbook CNES Edition
-------------------------------------------------------------------------------------------------
-- Softwares             :  Microsoft Windows (Windows 7) - Editor (Eclipse + VEditor)
-------------------------------------------------------------------------------------------------
-- Description : Handbook exemple: Clock domain crossing handshake based: good example
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
entity STD_04200_good is
   generic (g_Width : positive := 4);
   port (
      -- A clock domain (Source)
      i_ClockA     : in  std_logic;     -- First clock signal
      i_ResetA_n   : in  std_logic;     -- Reset signal
      i_Data       : in  std_logic_vector(g_Width-1 downto 0);  -- Data from source
      i_Request    : in  std_logic;     -- Request from source
      o_Grant      : out std_logic;     -- Acknowledge synced to source
      -- B clock domain (Destination)
      i_ClockB     : in  std_logic;     -- Second clock signal
      i_ResetB_n   : in  std_logic;     -- Reset signal
      o_Data       : out std_logic_vector(g_Width-1 downto 0);  -- Data to destination
      o_Request_r2 : out std_logic;     -- Request synced to destination
      i_Grant      : in  std_logic      -- Acknowledge from destination

      );
end STD_04200_good;

architecture Behavioral of STD_04200_good is
   signal Request_r1 : std_logic;       -- Request signal registered 1 time
   signal Request_r2 : std_logic;       -- Request signal registered 2 times
   signal Grant_r1   : std_logic;       -- Grant signal registered 1 time
   signal Grant_r2   : std_logic;       -- Grant signal registered 2 times
begin
   P_Source_Domain : process(i_ResetA_n, i_ClockA)
   begin
      if (i_ResetA_n = '0') then
         Grant_r1 <= '0';
         Grant_r2 <= '0';
      else
         if (rising_edge(i_ClockA)) then
            -- Synchronize i_Grant to i_ClockA domain
            Grant_r1 <= i_Grant;
            Grant_r2 <= Grant_r1;
         end if;
      end if;
   end process;

   P_Destination_Domain : process(i_ResetB_n, i_ClockB)
   begin
      if (i_ResetB_n = '0') then
         Request_r1 <= '0';
         Request_r2 <= '0';
      else
         if (rising_edge(i_ClockB)) then
            -- Synchronize i_Request to i_ClockB domain
            -- Data is valid when Request_r2 is asserted
            Request_r1 <= i_Request;
            Request_r2 <= Request_r1;
         end if;
      end if;
   end process;

   o_Request_r2 <= Request_r2;
   o_Data       <= i_Data;
   o_Grant      <= Grant_r2;
end Behavioral;
--CODE
