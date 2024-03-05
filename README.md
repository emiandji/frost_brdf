# frost_brdf
Source code for the following paper:
E. Miandji, T. Tongbuasirilai, S. Hajisharif, B. Kavoosighafi, and J. Unger, "FROST-BRDF: A Fast and Robust Optimal Sampling Technique for BRDF Acquisition", IEEE Transactions on Visualization and Computer Graphics, accepted for publication, 2024. 

-----------------------------------------------------------------------------------------------------

Code:

The source code is a collection of MATLAB scripts and was tested on MATLAB R2022b. 

To reproduce the results in the paper, run the following scripts (in order):
- createTrainingData.m
- createUSVfromTrainingData.m
- runMainOptimization.m
- runMainRecon.m

The scripts above will create a set of optimal sampling directions given the tranining set, sample a BRDF in the test set using the optimal sample direction, and reconstruct the full BRDF from the samples. 

Since the training is done once, the scripts createTrainingData.m, createUSVfromTrainingData.m, and runMainOptimization.m are executed once. 

The reconstruction script, i.e. runMainRecon.m, reconstructs one BRDF at a time. Therefore, lines 15 and 17 in runMainRecon.m should be changed for each BRDF you would like to reconstruct. 
Running the scripts without change will reconstruct gold-metallic-paint2 with 20 optimally placed samples, producing the FROST-BRDF results for this material in Fig. 8 of the paper.

The scripts provided can be used for reproducing all the figures in the paper and also in the supplementary. The only parameter is the number of samples, i.e. "npca" in line 5 of "runMainOptimization.m". In the paper, this parameter is denoted by _m_. Change this parameter accordingly for each experiment. For example, for Fig. 4 we used npca=10, while for Fig. 8 we used npca=20. Note that when the number of samples changes, the optimal sample direction have to be recomputed; i.e. one has to run "createUSVfromTrainingData.m" and "runMainOptimization.m".

Note that this repository does not include the rendering code. We used PBRT v2 to produce the rendering results in the paper. The convenience functions "merlWriter.m" and "reshape2merlwriter.m" can be used for writing MERL binary files from the reconstructed BRDF to be used by PBRT for rendering. 

-----------------------------------------------------------------------------------------------------

Data: 

The BRDFs we used for training and testing in the paper can be downloaded from

https://drive.google.com/file/d/18j-I-JkJAFaUyDtHnsaOBsQav1gPTPY8/view?usp=sharing

The zip file contains MATLAB's mat files for MERL, EPFL, and DTU data sets. There are two folders in the zip file: "BRDFs_Mat_for_train" and "BRDFs_MAT". Extract the zip file and place the two folders in the root folder of the repository. 

The folder "BRDFs_Mat_for_train" contains training BRDFs. 

The folder "BRDFs_MAT" contains test BRDFs. 

-----------------------------------------------------------------------------------------------------

Example:

To reproduce the FROST-BRDF result in Fig. 4, follow these steps:

1. In "runMainOptimization.m", change "npca=20" to "npca=10".
2. In "runMainRecon.m", change line 15 to "matname = 'vch-silk-blue-rgb';".
3. In "runMainRecon.m", change line 17 to "binpath = './BRDFs_Mat/EPFL/HD/no_transform';".
4. Run the scripts in the order specified above (in section "Code").

For more sophisticated figures, e.g. Figure 3, one has to write loops to run FROST-BRDF for all test BRDFs and number of samples.

-----------------------------------------------------------------------------------------------------

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
