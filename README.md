# frost_brdf
Source code for the following paper:
E. Miandji et al., "FROST-BRDF: A Fast and Robust Optimal Sampling Technique for BRDF Acquisition", IEEE Transactions on Visualization and Computer Graphics, 2024. 

To reproduce the results in the paper, run the following scripts (in order):
- createTrainingData.m
- createUSVfromTrainingData.m
- runMainOptimization.m
- runMainRecon.m

The BRDFs we used for training and testing in the paper can be downloaded from:

https://drive.google.com/file/d/18j-I-JkJAFaUyDtHnsaOBsQav1gPTPY8/view?usp=sharing

The zip file contains MATLAB's mat files for MERL, EPFL, and DTU data sets.

BRDFs used for training are placed in directory "BRDFs_Mat_for_train". 

BRDFs used for testing are placed in directory "BRDFs_MAT". 

For inquiries, please contact:

ehsan.miandji@liu.se or
tanaboon891@gmail.com
