# frost_brdf
Source code for the following paper:
E. Miandji et al., "FROST-BRDF: A Fast and Robust Optimal Sampling Technique for BRDF Acquisition", IEEE Transactions on Visualization and Computer Graphics, 2024. 

To reproduce the results in the paper, run the following scripts (in order):
- createTrainingData.m
- createUSVfromTrainingData.m
- runMainOptimization.m
- runMainRecon.m

BRDFs used for training are placed in directory "BRDFs_Mat_for_train". 
BRDFs used for testing are placed in directory "BRDFs_MAT". 
