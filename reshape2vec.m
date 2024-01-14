% This work © 2023 by Tanaboon Tongbuasirilai is licensed under CC BY-NC-SA 4.0 
% Simple reshape function used across brdf-sampling project.
% reshape must be the same for all matrices.
% This reshape function compatible to python [DTU-ordering].

function vec = reshape2vec(mat3d, vecsize)

    x = permute(mat3d, [2 1 3]);
    vec = reshape(x, [vecsize 1]);
    
end