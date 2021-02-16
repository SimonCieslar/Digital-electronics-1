## Labs - 01 - gates

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

![DeMorgan](Images/DeMorganLaws.gif)

EDA Playground code ([LINK](https://www.edaplayground.com/x/8PuF))


### **Architercture code for De Morgan's laws**
![DeMorganArchitecture](Images/DeMorganArchitecture.png)

### **Waveform of the De Morgan's laws**
![DeMorganWaveform](Images/DeMorganWaveform.png)


# De Morgan's

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

![DistributivesLaws](Images/DistributivesLaws.png)

### **Distributive Laws Architecture**
![DistributiveLawsArchitecture](Images/DistributiveLawsArchitecture.png)

### **Distributive Laws Waveform**
![DistributiveLawsWaveform](Images/DistributiveLawsWaveform.png)

