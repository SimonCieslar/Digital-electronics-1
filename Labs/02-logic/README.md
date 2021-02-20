# Labs - 02 - logic

## Lab assignment

1. Preparation tasks (done before the lab at home). Submit:
   * Binary comparator truth table.

2. A 2-bit comparator. Submit:
   * Karnaugh maps for all three functions.
   * Simplified SoP form of the "greater than" function and simplified PoS form of the "less than" function.
   * Link to your public EDA Playground example in the form `https://www.edaplayground.com/...`

3. A 4-bit binary comparator. Submit:
   * Listing of VHDL code (`design.vhd`),
   * Listing of VHDL testbench (`testbench.vhd`),
   * Listing of simulator console output, i.e. with reported error,
   * Link to your public EDA Playground example.


## 1. Preparation tasks (done before the lab at home).

*Digital* or *Binary comparator* compares the digital signals A, B presented at input terminal and produce outputs depending upon the condition of those inputs. Complete the truth table for 2-bit *Identity comparator* (B equals A), and two *Magnitude comparators* (B is greater than A, B is less than A). Note that, such a digital device has four inputs and three outputs/functions.

| **Dec. equivalent** | **B[1:0]** | **A[1:0]** | **B is greater than A** | **B equals A** | **B is less than A** |
| :-: | :-: | :-: | :-: | :-: | :-: |
| 0 | 0 0 | 0 0 | 0 | 1 | 0 |
| 1 | 0 0 | 0 1 | 0 | 0 | 1 |
| 2 | 0 0 | 1 0 | 0 | 0 | 1 |
| 3 | 0 0 | 1 1 | 0 | 0 | 1 |
| 4 | 0 1 | 0 0 | 1 | 0 | 0 |
| 5 | 0 1 | 0 1 | 0 | 1 | 0 |
| 6 | 0 1 | 1 0 | 0 | 0 | 1 |
| 7 | 0 1 | 1 1 | 0 | 0 | 1 |
| 8 | 1 0 | 0 0 | 1 | 0 | 0 |
| 9 | 1 0 | 0 1 | 1 | 0 | 0 |
| 10 | 1 0 | 1 0 | 0 | 1 | 0 |
| 11 | 1 0 | 1 1 | 0 | 0 | 1 |
| 12 | 1 1 | 0 0 | 1 | 0 | 0 |
| 13 | 1 1 | 0 1 | 1 | 0 | 0 |
| 14 | 1 1 | 1 0 | 1 | 0 | 0 |
| 15 | 1 1 | 1 1 | 0 | 1 | 0 |

## 2. A 2-bit comparator.

### Karnaugh maps for all three functions

### B is greater than A

![K_Mapa_B_is_greater_than_A](Images/K_Mapa_B_is_greater_than_A.png)

### B equals A

![K_Mapa_B_equals_A](Images/K_Mapa_B_equals_A.png)

### B is less than A

![K_Mapa_B_is_less_than_A](Images/K_Mapa_B_is_less_than_A.png)



EDA Playground code ([LINK](https://www.edaplayground.com/x/kAMu))

## 3. A 4-bit binary comparator.
