----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/16/2021 12:54:49 AM
-- Design Name: 
-- Module Name: mux_2bit_6to1 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux_2bit_6to1 is
port(
        a_i           : in  std_logic_vector(2 - 1 downto 0); -- Data A
        b_i           : in  std_logic_vector(2 - 1 downto 0); -- Data B
        c_i           : in  std_logic_vector(2 - 1 downto 0); -- Data C
        d_i           : in  std_logic_vector(2 - 1 downto 0); -- Data E
        e_i           : in  std_logic_vector(2 - 1 downto 0); -- Data F
        f_i           : in  std_logic_vector(2 - 1 downto 0); -- Data E
        sel_i         : in  std_logic_vector(3 - 1 downto 0); -- Data Sel
        f_o           : out  std_logic_vector(2 - 1 downto 0) -- Output F
        --clk           : in  std_logic
    );
end mux_2bit_6to1;

architecture Behavioral of mux_2bit_6to1 is

--constant clocking_period : natural := 900000; --900000 ticks at 450000000MHz = 2ms for a total 
                                              --of 12ms for 6 led bargraphs

begin
       f_o <= a_i when (sel_i = "000") else
              b_i when (sel_i = "001") else
              c_i when (sel_i = "010") else
              d_i when (sel_i = "011") else
              e_i when (sel_i = "100") else
              f_i;                 -- All other combinations
    

end Behavioral;