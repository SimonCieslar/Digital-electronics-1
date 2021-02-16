# Labs - 01 - gates

## Lab assignment

1. Submit the GitHub link to your `Digital-electronics-1` repository.

2. Verification of De Morgan's laws of function f(c,b,a). Submit:
    * Listing of VHDL code `design.vhd`,
    * Screenshot with simulated time waveforms,
    * Link to your public EDA Playground example.

3. Verification of Distributive laws. Submit:
    * Listing of VHDL code `design.vhd`,
    * Screenshot with simulated time waveforms,
    * Link to your public EDA Playground example.

## 1. Submit the GitHub link
My GitHub [link](https://github.com/SimonCieslar/Digital-electronics-1).

## 2. Verification of De Morgan's laws of function f(c,b,a)
**Formulation of function**

![DeMorgan](Images/DeMorganLaws.gif)

EDA Playground code ([LINK](https://www.edaplayground.com/x/8PuF))


### **Architercture code for De Morgan's laws**
> Excerpt from `design.vhd`:
```vhdl
architecture dataflow of gates is
begin
    f_o  <= (not b_i and a_i) or (not b_i and not c_i);
    
    fnand_o <= not(not((not b_i) and a_i) and not(not c_i and not b_i));
    
    fnor_o <= not(b_i or not a_i) or not(c_i or b_i);

end architecture dataflow;
```

### **Waveform of the De Morgan's laws (simulation)**
![DeMorganWaveform](Images/DeMorganWaveform.png)


# De Morgan's laws

| **c** | **b** |**a** | **f(c,b,a)** | **f(c,b,a)nand** | **f(c,b,a)nor** |
| :-: | :-: | :-: | :-: | :-: | :-: |
|  0  |  0  |  0  |  1  |  1  |  1  | 
|  0  |  0  |  1  |  1  |  1  |  1  |   
|  0  |  1  |  0  |  0  |  0  |  0  |    
|  0  |  1  |  1  |  0  |  0  |  0  |     
|  1  |  0  |  0  |  0  |  0  |  0  |   
|  1  |  0  |  1  |  1  |  1  |  1  |   
|  1  |  1  |  0  |  0  |  0  |  0  |    
|  1  |  1  |  1  |  0  |  0  |  0  |  


## 3. Verification of Distributive laws

EDA Playground code ([LINK](https://www.edaplayground.com/x/wQEb))

# Distributive laws
Formulation of function
![DistributivesLaws](Images/DistributivesLaws.png)

### **Distributive Laws Architecture**
> Excerpt from `design.vhd`:
```vhdl
architecture dataflow of gates is
begin
    d1_o  <= (x_i and y_i) or (x_i and z_i);
    
    d2_o  <= x_i and (y_i or z_i);
    
    d3_o  <= (x_i or y_i) and (x_i or z_i);
    
    d4_o  <= x_i or (y_i and z_i);
   
end architecture dataflow;
```
### **Waveform of the Distributive Laws (simulation)**
![DistributiveLawsWaveform](Images/DistributiveLawsWaveform.png)

