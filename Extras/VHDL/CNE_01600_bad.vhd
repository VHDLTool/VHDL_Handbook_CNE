-------------------------------------------------------------------------------------------------
-- Company   : CNES
-- Author    : Mickael Carl (CNES)
-- Copyright : Copyright (c) CNES. 
-- Licensing : GNU GPLv3
-------------------------------------------------------------------------------------------------
-- Version         : V1
-- Version history : 
--    V1 : 2015-04-15 : Mickael Carl (CNES): Creation
-------------------------------------------------------------------------------------------------
-- File name          : CNE_01600_bad.vhd
-- File Creation date : 2015-04-15
-- Project name       : VHDL Handbook CNES Edition 
-------------------------------------------------------------------------------------------------
-- Softwares             :  Microsoft Windows (Windows 7) - Editor (Eclipse + VEditor)
-------------------------------------------------------------------------------------------------
-- Description : Handbook example: Identification of package element: bad example
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

library work;
use work.pkg_HBK.all;

entity CNE_01600_good is
   port  (
      i_Clock     : in std_logic;                        -- Global clock signal
      i_Reset_n   : in std_logic;                        -- Global reset signal
      i_Raz       : in std_logic;                        -- Reset counting and load length
      i_Enable    : in std_logic;                        -- Enable the counter
      i_Length    : in std_logic_vector(Width downto 0); -- How much the module should count (Value expected - 1)
      o_Done      : out std_logic                        -- Counter output
   );
end CNE_01600_good;

architecture Behavioral of CNE_01600_good is
   signal Count   : signed(Width downto 0);  -- Counting signal
   signal Length  : signed(Width downto 0);  -- How much the module should count
   signal Done    : std_logic;               -- Counter output
begin
   P_Count:process(i_Reset_n, i_Clock)
   begin
      if (i_Reset_n='0') then
         Count <= (others => '0');
         Length <= (others => '0');
         Done <= '0';
      elsif (rising_edge(i_Clock)) then
            if (i_Raz='1') then
            -- Reset the counting
               Length <= signed(i_Length);
               Count <= (others => '0');
            elsif (i_Enable='1' and Done='0') then
            -- Counter activated and not finished
               Count <= Count + 1;
            end if;
            if (Count>=Length) then -- Compared elements are of the same type and dimension
            -- Counter finished
               Done <= '1';
            else
               Done <= '0';
            end if;
      end if;
   end process;
   
   o_Done <= Done;
end Behavioral;