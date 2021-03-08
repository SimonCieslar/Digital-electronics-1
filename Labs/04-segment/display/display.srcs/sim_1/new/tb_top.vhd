library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_top is
--  Port ( );
end tb_top;

architecture Behavioral of tb_top is

       signal s_SW   :  STD_LOGIC_VECTOR (4 - 1 downto 0); --Input binary data
       signal s_LED  :  STD_LOGIC_VECTOR (8 - 1 downto 0); --LED indificators
       signal s_CA   :  STD_LOGIC; --Cathode A
       signal s_CB   :  STD_LOGIC; --Cathode B
       signal s_CC   :  STD_LOGIC; --Cathode C
       signal s_CD   :  STD_LOGIC; --Cathode D
       signal s_CE   :  STD_LOGIC; --Cathode E
       signal s_CF   :  STD_LOGIC; --Cathode F     
       signal s_CG   :  STD_LOGIC; --Cathode G
       signal s_AN   :  STD_LOGIC_VECTOR(8 - 1 downto 0); --Common anode signals to individual displays

begin

uut_top : entity work.top
        port map
        (
            SW     => s_SW,
            LED    => s_LED,
            CA     => s_CA,
            CB     => s_CB, 
            CC     => s_CC,
            CD     => s_CD,
            CE     => s_CE,
            CF     => s_CF,
            CG     => s_CG,
            AN     => s_AN   
        );

 p_stimulus : process
begin

report "Stimulus process started" severity note;

        s_SW <= "0000"; wait for 100ns;
        
        s_SW <= "0001"; wait for 100ns;
        
        s_SW <= "0010"; wait for 100ns;
        
        s_SW <= "0011"; wait for 100ns;
        
        s_SW <= "0100"; wait for 100ns;
        
        s_SW <= "0101"; wait for 100ns;
        
        s_SW <= "0110"; wait for 100ns;
        
        s_SW <= "0111"; wait for 100ns;
        
        s_SW <= "1000"; wait for 100ns;
        
        s_SW <= "1001"; wait for 100ns;
        
        s_SW <= "1010"; wait for 100ns;
        
        s_SW <= "1011"; wait for 100ns;
        
        s_SW <= "1100"; wait for 100ns;
        
        s_SW <= "1101"; wait for 100ns;
        
        s_SW <= "1110"; wait for 100ns;
        
        s_SW <= "1111"; wait for 100ns;
     
report "Stimulus process finished" severity note;
         wait;
    end process p_stimulus;

end Behavioral;
