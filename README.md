# frost_brdf
Source code for the following paper:
E. Miandji, T. Tongbuasirilai, S. Hajisharif, B. Kavoosighafi, and J. Unger, "FROST-BRDF: A Fast and Robust Optimal Sampling Technique for BRDF Acquisition", IEEE Transactions on Visualization and Computer Graphics, accepted for publication, 2024. 

The source code is a collection of MATLAB scripts and was tested on MATLAB R2022b. 

To reproduce the results in the paper, run the following scripts (in order):
- createTrainingData.m
- createUSVfromTrainingData.m
- runMainOptimization.m
- runMainRecon.m

The scripts above will create a set of optimal sampling directions given the tranining set, sample a BRDF in the test set using the optimal sample direction, and reconstruct the full BRDF from the samples. 
Note that this repository does not include the rendering code. We used PBRT v2 to produce the rendering results in the paper. The convenience functions "merlWriter.m" and "reshape2merlwriter.m" can be used for writing MERL binary files from the reconstructed BRDF to be used by PBRT for rendering. 

The BRDFs we used for training and testing in the paper can be downloaded from:

https://drive.google.com/file/d/18j-I-JkJAFaUyDtHnsaOBsQav1gPTPY8/view?usp=sharing

The zip file contains MATLAB's mat files for MERL, EPFL, and DTU data sets. There are two folders in the zip file: "BRDFs_Mat_for_train" and "BRDFs_MAT". Extract the zip file and place the two folders in the root folder of the repository. 

The folder "BRDFs_Mat_for_train" contains training BRDFs. 

The folder "BRDFs_MAT" contains test BRDFs. 

Since the training is done once, the scripts createTrainingData.m, createUSVfromTrainingData.m, and runMainOptimization.m are executed once. The reconstruction script, i.e. runMainRecon.m, reconstructs one BRDF at a time. Therefore, lines 15 and 17 should be changed for each BRDF you would like to reconstruct. 

The scripts provided can be used for replicating all the figures in the paper and also the supplementary. 

For inquiries, please contact:

ehsan.miandji@liu.se or
tanaboon.to@ku.th


Shield: [![CC BY-NC-SA 4.0][cc-by-nc-sa-shield]][cc-by-nc-sa]

This work is licensed under a
[Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License][cc-by-nc-sa].

[![CC BY-NC-SA 4.0][cc-by-nc-sa-image]][cc-by-nc-sa]

[cc-by-nc-sa]: http://creativecommons.org/licenses/by-nc-sa/4.0/
[cc-by-nc-sa-image]: https://licensebuttons.net/l/by-nc-sa/4.0/88x31.png
[cc-by-nc-sa-shield]: https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg
