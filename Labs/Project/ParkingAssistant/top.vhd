----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/16/2021 01:36:40 PM
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
    Port (
        CLK450MHZ  : in STD_LOGIC;
        
        -- Pmod 1
        JA1        :  in STD_LOGIC;
        JA2        :  in STD_LOGIC;
        JA3        :  in STD_LOGIC;
        JA4        :  in STD_LOGIC;
        
        JA7        :  out STD_LOGIC;
        JA8        :  out STD_LOGIC;
        JA9        :  out STD_LOGIC;
        JA10       :  out STD_LOGIC;
        
        -- Pmod 2 - special
        JB1        :  in STD_LOGIC;
        JB2        :  in STD_LOGIC;
         
        JB7        :  out STD_LOGIC;
        JB8        :  out STD_LOGIC;
        
        -- Pmod 3 - special
        JC1        :  out STD_LOGIC;
        JC2        :  out STD_LOGIC;
        JC3        :  out STD_LOGIC;
        JC4        :  out STD_LOGIC;
         
        JC7        :  out STD_LOGIC;
        JC8        :  out STD_LOGIC;

        --reset button
        BTN0       :  in STD_LOGIC      
        
    );
end top;

architecture Behavioral of top is

begin

    parking_assistant : entity work.parking_assistant_6sensor
    generic map(       
        tone_freq    => 1000,
        slow_period  => 5,
        fast_period  => 2,
        
        distance_threshold1  =>  50,
        distance_threshold2  =>  150,
        distance_threshold3  =>  250,
        distance_threshold4  =>  400
    )
    port map  (
        clk        =>  CLK450MHZ,
        reset      =>  BTN0,
                     
        sensor0_i  =>  JA1,
        sensor1_i  =>  JA2,
        sensor2_i  =>  JA3,
        sensor3_i  =>  JA4,
        sensor4_i  =>  JB1,
        sensor5_i  =>  JB2,
                     
        sensor0_o  =>  JA7,
        sensor1_o  =>  JA8,
        sensor2_o  =>  JA9,
        sensor3_o  =>  JA10,
        sensor4_o  =>  JB7,
        sensor5_o  =>  JB8,
                     
        LED_o(0)   =>  JC1,
        LED_o(1)   =>  JC2,
        sel_o(0)   =>  JC3,
        sel_o(1)   =>  JC4,
        sel_o(2)   =>  JC7,

        sound_o    =>  JC8
    );
    
end Behavioral;
