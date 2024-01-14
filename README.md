# frost_brdf
Source code for the following paper:
E. Miandji, T. Tongbuasirilai, S. Hajisharif, B. Kavoosighafi, and J. Unger, "FROST-BRDF: A Fast and Robust Optimal Sampling Technique for BRDF Acquisition", IEEE Transactions on Visualization and Computer Graphics, accepted for publication, 2024. 

The source code is a collection of MATLAB scripts and was tested on MATLAB R2022b. 

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
tanaboon.to@ku.th


Shield: [![CC BY-NC-SA 4.0][cc-by-nc-sa-shield]][cc-by-nc-sa]

This work is licensed under a
[Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License][cc-by-nc-sa].

[![CC BY-NC-SA 4.0][cc-by-nc-sa-image]][cc-by-nc-sa]

[cc-by-nc-sa]: http://creativecommons.org/licenses/by-nc-sa/4.0/
[cc-by-nc-sa-image]: https://licensebuttons.net/l/by-nc-sa/4.0/88x31.png
[cc-by-nc-sa-shield]: https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg
