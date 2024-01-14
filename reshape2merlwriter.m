% This work © 2023 by Tanaboon Tongbuasirilai is licensed under CC BY-NC-SA 4.0 
% Simple reshape function used across brdf-sampling project.
% reshape must be the same for all matrices.
% This reshape function compatible to python [DTU-ordering].

function vec = reshape2merlwriter(mat1d)

    mat3d = reshape(mat1d, [90 90 180]);    % ordering [td th pd]
    mat3d = permute(mat3d, [2 1 3]);    % permute back to [th td pd]
    mat3d = permute(mat3d, [3 2 1]);    % permute to merl ordering [pd td th]
    vec = reshape(mat3d, [90*90*180 1]);
    
end