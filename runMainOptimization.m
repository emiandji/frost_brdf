% This work © 2023 by Ehsan Miandji is licensed under CC BY-NC-SA 4.0 
clear; clc;

svdMat = './dataMatlab/log_relative/USV.mat';
npca = 20;
nlocation = npca;
samplingfile = sprintf('./dataMatlab/SOMP_normQ_npc%d_nl%d.mat', npca, nlocation);

mainOptimization(svdMat, npca, nlocation, samplingfile);

