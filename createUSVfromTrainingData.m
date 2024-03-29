% This work © 2023 by Ehsan Miandji is licensed under CC BY-NC-SA 4.0 
%% Init values
% data files generated from 'createTrainingData.m'
clear
clc

samples = 393;  % Change this regarding the training samples.

data_dir = './dataMatlab/log_relative/';

m_mean = load(strcat(data_dir, 'BRDF_mean.mat'));
m_data = load(strcat(data_dir, 'BRDF_pca_data.mat'));

nanpermute = load('./data/maskmap-nan-EPFL-DTUordering.mat');

disp('doing pca...');
X = m_data.brdf_log_relative - m_mean.brdf_mean;
X(nanpermute.nanIds,:) = [];    % invalid angles

[U,S,V] = svd(X, 'econ');

disp('done pca... saving data...');
clear X

save(sprintf('%sUSV.mat', data_dir), 'U', 'S', 'V', '-v7.3');
disp('done saving...');
