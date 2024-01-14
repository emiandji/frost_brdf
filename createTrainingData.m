% This work © 2023 by Ehsan Miandji is licensed under CC BY-NC-SA 4.0 
%% Create transformed data for training
clear
clc

% load material list
% [create Nielsen_MERL_EPFL]
clear
clc
binPath{1} = './BRDFs_Mat_for_train/MERL/HD/';    % path to '.mat' files
binPath{2} = './BRDFs_Mat_for_train/EPFL/HD/';    % path to '.mat' files
savePath = './dataMatlab/log_relative/';
mkdirStatus = mkdir(savePath)

epsilon = 0.001;
w = load('./data/MERL_logrelative_weight.mat'); % weights
weight_matrix = w.weight_matrix;
nanx = load('./data/maskmap-nan-EPFL-DTUordering.mat'); % maskmap

numBrdfs = length(dir(binPath{1})) - 2 + length(dir(binPath{2})) - 2;
xxx = zeros(90*90*180, numBrdfs*3);
runk = 1;

for bp = 1:length(binPath)
    
    bdir = dir(binPath{bp});
    for i = 1:length(bdir)
        if bdir(i).isdir == 0
            mname = strsplit(bdir(i).name, '.');
            mname = char(mname(1))
            
            loadedMat = load(strcat(binPath{bp}, mname, '.mat'));
            
            r = loadedMat.brdf4d(:,:,:,1);
            g = loadedMat.brdf4d(:,:,:,2);
            b = loadedMat.brdf4d(:,:,:,3);
            
            r(nanx.nanmap3d) = 0.0;
            g(nanx.nanmap3d) = 0.0;
            b(nanx.nanmap3d) = 0.0;
            r = reshape2vec(r, 90*90*180);
            g = reshape2vec(g, 90*90*180);
            b = reshape2vec(b, 90*90*180);
           
            xxx(:,runk) = r;
            xxx(:,runk+1) = g;
            xxx(:,runk+2) = b;
            
            runk = runk+3;
            
        end
    end
end

wm = reshape2vec(weight_matrix, 90*90*180);

brdf_ref = median(xxx.*wm,2);
save(strcat(savePath, 'BRDF_ref.mat'), 'brdf_ref', 'epsilon');

brdf_log_relative = log( (xxx.*wm + epsilon)./ (brdf_ref + epsilon) );
save(strcat(savePath, 'BRDF_pca_data.mat'), 'brdf_log_relative', 'epsilon', '-v7.3');

brdf_mean = mean(brdf_log_relative,2);
save(strcat(savePath, 'BRDF_mean.mat'), 'brdf_mean');

disp('done ...');