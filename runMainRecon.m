% This work © 2023 by Ehsan Miandji is licensed under CC BY-NC-SA 4.0 
%% test reconstruction by sampling from a material 
clear; clc; 
% load up files
allMats{1} = './dataMatlab/SOMP_normQ_npc20_nl20.mat';
allMats{2} = './dataMatlab/log_relative/BRDF_ref.mat';
allMats{3} = './dataMatlab/log_relative/BRDF_mean.mat';
allMats{4} = './data/MERL_logrelative_weight.mat';
allMats{5} = './data/maskmap-nan-EPFL-DTUordering.mat';
allMats{6} = './dataMatlab/log_relative/USV.mat';

% set reconstruction file 
reconFile = './recon/test.binary';

matname = 'alum-bronze'

binpath = './BRDFs_Mat/MERL/HD/no_transform';          
mat_path = strcat(binpath, '/', matname,'.mat'); 
loadedMat = load(mat_path);

% do sampling from each color channel
nanx = load(allMats{5});
sr = loadedMat.brdf4d(:,:,:,1);
sr(nanx.nanmap3d) = 0.0;
sr = reshape2vec(sr, 90*90*180);
sr(nanx.nanIds) = [];

sg = loadedMat.brdf4d(:,:,:,2);
sg(nanx.nanmap3d) = 0.0;
sg = reshape2vec(sg, 90*90*180);
sg(nanx.nanIds) = [];

sb = loadedMat.brdf4d(:,:,:,3);
sb(nanx.nanmap3d) = 0.0;
sb = reshape2vec(sb, 90*90*180);
sb(nanx.nanIds) = [];

sp = load(allMats{1});
sr = sr(sp.nzl);
sg = sg(sp.nzl);
sb = sb(sp.nzl);

sampledData = [sr sg sb];

mainRecon(reconFile, allMats, sampledData);