# Labs - 05 - Counter

## Experiments on your own

1. Add a second instantiation (copy) of the counter (`bin_cnt1`) and clock enable (`clk_en1`) entities and make a 16-bit counter with a different time base. Display its value on LED(15:0).

## Lab assignment

1. Preparation tasks (done before the lab at home). Submit:
    * Figure or table with connection of push buttons on Nexys A7 board,
    * Table with calculated values.

2. Bidirectional counter. Submit:
    * Listing of VHDL code of the process `p_cnt_up_down` with syntax highlighting.
    * Listing of VHDL reset and stimulus processes from testbench file `tb_cnt_up_down.vhd` with syntax highlighting and asserts,
    * Screenshot with simulated time waveforms; always display all inputs and outputs,

3. Top level. Submit:
    * Listing of VHDL code from source file `top.vhd` with all instantiations for the 4-bit bidirectional counter.
    * (Hand-drawn) sketch of the top layer including both counters, ie a 4-bit bidirectional counter from Part 4 and a 16-bit counter with a different time base from Part Experiments on your own.
