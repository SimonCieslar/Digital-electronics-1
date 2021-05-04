----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/16/2021 12:36:59 PM
-- Design Name: 
-- Module Name: parking_assistant_6sensor - Behavioral
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

entity parking_assistant_6sensor is
    generic(
        tone_freq            : natural; --Hz
        slow_period          : natural; --ms
        fast_period          : natural; --ms
        
        distance_threshold1  :  natural;
        distance_threshold2  :  natural;
        distance_threshold3  :  natural;
        distance_threshold4  :  natural
    );     
    Port (
        clk            : in  std_logic;
        reset          : in  std_logic;
        
        sensor0_i      : in  std_logic:='0';
        sensor1_i      : in  std_logic:='0';
        sensor2_i      : in  std_logic:='0';
        sensor3_i      : in  std_logic:='0';
        sensor4_i      : in  std_logic:='0';
        sensor5_i      : in  std_logic:='0';
       
        sensor0_o      : out  std_logic:='0';
        sensor1_o      : out  std_logic:='0';
        sensor2_o      : out  std_logic:='0';
        sensor3_o      : out  std_logic:='0';
        sensor4_o      : out  std_logic:='0';
        sensor5_o      : out  std_logic:='0';
       
        LED_o          : out std_logic_vector(2 - 1 downto 0):="00";
        sel_o          : out std_logic_vector(3 - 1 downto 0);
        
        sound_o        : out std_logic
     );
end parking_assistant_6sensor;

architecture Behavioral of parking_assistant_6sensor is
        --dist from front and back drivers
        signal dist_lvl_front  : std_logic_vector(2 - 1 downto 0);
        signal dist_lvl_back   : std_logic_vector(2 - 1 downto 0);
        --dist of individual sensors
        signal dist_lvl0       : std_logic_vector(2 - 1 downto 0);
        signal dist_lvl1       : std_logic_vector(2 - 1 downto 0);
        signal dist_lvl2       : std_logic_vector(2 - 1 downto 0);
        signal dist_lvl3       : std_logic_vector(2 - 1 downto 0);
        signal dist_lvl4       : std_logic_vector(2 - 1 downto 0);
        signal dist_lvl5       : std_logic_vector(2 - 1 downto 0);
        
        signal tone_gen_data_i : std_logic_vector(2 - 1 downto 0); 
        --multiplexer and demultiplexer output from sensors to drivers
        signal sensorfront_i   : std_logic;
        signal sensorfront_o   : std_logic;
        signal sensorback_i    : std_logic;
        signal sensorback_o    : std_logic;
        
        type t_state is (LEFT, 
                         CENTER,   
                         RIGHT   
                         );
        signal sensor_front    : t_state :=LEFT;
        signal sensor_back     : t_state :=LEFT;
        
        signal updatefront_i   :  std_logic;
        signal updateback_i    :  std_logic;
        --LED multiplexer sel signal
        signal s_sel_o         : std_logic_vector(3 - 1 downto 0);
        
        signal s_2ms           :  std_logic;
        
        signal s_cnt1          :  natural;
        signal s_cnt2          :  natural;

begin

    p_front_sensor_select : process(clk)
    begin
        if rising_edge(clk) then
            case sensor_front is
                when LEFT =>
                        sensorfront_i <= sensor0_i;
                        sensor0_o <= sensorfront_o;
                        
                        if(updatefront_i = '1') then
                            dist_lvl0 <= dist_lvl_front;
                            sensor_front <= CENTER;
                        end if;
                when CENTER =>                
                        sensorfront_i <= sensor1_i;
                        sensor1_o <= sensorfront_o;

                        if(updatefront_i = '1') then
                            dist_lvl1 <= dist_lvl_front;
                            sensor_front <= RIGHT;
                        end if;
                when RIGHT =>
                        sensorfront_i <= sensor2_i;
                        sensor2_o <= sensorfront_o;

                        if(updatefront_i = '1') then
                            dist_lvl2 <= dist_lvl_front;
                            sensor_front <= LEFT;
                        end if;
            end case;
        end if;
    end process p_front_sensor_select;
    
    p_back_sensor_select : process(clk)
    begin
        if rising_edge(clk) then
            case sensor_back is
                when LEFT =>
                        sensorback_i <= sensor3_i;
                        sensor3_o <= sensorback_o;

                        if(updateback_i = '1') then
                            dist_lvl3 <= dist_lvl_back;
                            sensor_back <= CENTER;
                        end if;
                when CENTER =>                
                        sensorback_i <= sensor4_i;
                        sensor4_o <= sensorback_o;

                        if(updateback_i = '1') then
                            dist_lvl4 <= dist_lvl_back;
                            sensor_back <= RIGHT;
                        end if;
                when RIGHT =>
                        sensorback_i <= sensor5_i;
                        sensor5_o <= sensorback_o;

                        if(updateback_i = '1') then
                            dist_lvl5 <= dist_lvl_back;
                            sensor_back <= LEFT;
                        end if;
            end case;
        end if;
    end process p_back_sensor_select;  
    
    urm_driver_front : entity work.urm_driver_decoder
            generic map(
                g_lvl_0      => distance_threshold1,
                g_lvl_1      => distance_threshold2,
                g_lvl_2      => distance_threshold3,
                g_lvl_3      => distance_threshold4
            )
            port map(
                clk          => clk,
                reset        => reset,
                sensor_out_i => sensorfront_i,
                sensor_in_o  => sensorfront_o,
                dist_lvl_o   => dist_lvl_front,
                update_o     => updatefront_i
            );
    
    urm_driver_back : entity work.urm_driver_decoder
            generic map(
                g_lvl_0      => distance_threshold1,
                g_lvl_1      => distance_threshold2,
                g_lvl_2      => distance_threshold3,
                g_lvl_3      => distance_threshold4
            )
            port map(
                clk          => clk,
                reset        => reset,
                sensor_out_i => sensorback_i,
                sensor_in_o  => sensorback_o,
                dist_lvl_o   => dist_lvl_back,
                update_o     => updateback_i
            );
            
    distance_comparator : entity work.distance_comparator
            port map (
                a_i          => dist_lvl0,
                b_i          => dist_lvl1,
                c_i          => dist_lvl2,
                d_i          => dist_lvl3,
                e_i          => dist_lvl4,
                f_i          => dist_lvl5,
                greatest_o   => tone_gen_data_i
            );
    tone_gen: entity work.beep_generator
            generic map(
                tone_freq    =>  tone_freq,  -- 1000; --Hz
                slow_period  =>  slow_period,  -- 5; --ms
                fast_period  =>  fast_period  -- 2  --ms
            )  
            port map  (
                clk          =>  clk,
                reset        =>  reset,
                dist_lvl     =>  tone_gen_data_i,
                tone_o       =>  sound_o
            );
            
    mux_led: entity work.mux_2bit_6to1
            port map (
                a_i          =>  dist_lvl0, 
                b_i          =>  dist_lvl1, 
                c_i          =>  dist_lvl2, 
                d_i          =>  dist_lvl3, 
                e_i          =>  dist_lvl4, 
                f_i          =>  dist_lvl5, 
                sel_i        =>  s_sel_o,
                f_o          =>  LED_o
                );
    
    clk_en0 : entity work.clock_enable
        generic map(
            g_MAX => 200000
        )
        port map(
            clk   => clk,
            reset => reset,
            ce_o  => s_2ms
        ); 
        
    bin_cnt0 : entity work.cnt_up_down
        generic map(
            g_CNT_WIDTH => 3
        )
        port map(
            clk       => clk,
            reset     => reset,
            en_i      => s_2ms,
            cnt_up_i  => '1',
            cnt_o     => s_sel_o            
        );         
    
    sel_o <= s_sel_o; --LED mux output sel
    
end Behavioral;
