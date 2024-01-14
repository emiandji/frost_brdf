% This work © 2023 by Ehsan Miandji is licensed under CC BY-NC-SA 4.0 
% sampledData size : [ nzl, 3 ]
function mainRecon(reconFile, allMats, sampledData)

    % load up neccesary data
    samplingMat = allMats{1};
    refMat = allMats{2};
    meanMat = allMats{3};
    weightMat = allMats{4};
    nanxMat = allMats{5};
    usvMat = allMats{6};

    loadedsvd = load(usvMat);
    Q = loadedsvd.U * loadedsvd.S;
    delete loadedsvd;

    data_ref = load(refMat);
    data_mean = load(meanMat);
    nanx = load(nanxMat);
    w = load(weightMat);
    weight_matrix = w.weight_matrix;
    wm = reshape2vec(weight_matrix, 90*90*180);
    sp = load(samplingMat);
    
    % retrive only from sampling locations
    nzl_brdf_ref = data_ref.brdf_ref;
    nzl_brdf_ref(nanx.nanIds) = [];
    nzl_brdf_ref = nzl_brdf_ref(sp.nzl);
    
    nzl_brdf_mean = data_mean.brdf_mean;
    nzl_brdf_mean(nanx.nanIds) = [];
    nzl_brdf_mean = nzl_brdf_mean(sp.nzl);
    
    nzl_wm = wm;
    nzl_wm(nanx.nanIds) = [];
    nzl_wm = nzl_wm(sp.nzl);

    epsilon = data_ref.epsilon;
    
    sp_r = sampledData(:,1);
    sp_g = sampledData(:,2);
    sp_b = sampledData(:,3);
    
    % log-relative mapping
    sp_r = logRelativeMapping(sp_r, nzl_wm, nzl_brdf_ref, epsilon);
    sp_g = logRelativeMapping(sp_g, nzl_wm, nzl_brdf_ref, epsilon);
    sp_b = logRelativeMapping(sp_b, nzl_wm, nzl_brdf_ref, epsilon);

    sp_r = sp_r - nzl_brdf_mean;
    sp_g = sp_g - nzl_brdf_mean;
    sp_b = sp_b - nzl_brdf_mean;
    
    eta = 40;
    Qhat = Q(sp.nzl,:);
    kcoef = size(sampledData,1);    
    [c_r, c_g, c_b] = solver_L2(Qhat, kcoef, sp_r, sp_g, sp_b, eta);
    
    % x = Q*c + mean
    u = data_mean.brdf_mean;
    u(nanx.nanIds) = [];
    recon_r = Q(:,1:kcoef)*c_r + u;
    recon_g = Q(:,1:kcoef)*c_g + u;
    recon_b = Q(:,1:kcoef)*c_b + u;
    

    % assign values back to 90x90x180 resolutions.
    recon_rFull = ones(90*90*180,1)*-1;
    recon_gFull = ones(90*90*180,1)*-1;
    recon_bFull = ones(90*90*180,1)*-1;

    recon_rFull(nanx.notnanIds) = recon_r;
    recon_gFull(nanx.notnanIds) = recon_g;
    recon_bFull(nanx.notnanIds) = recon_b;

    % inverse mapping of x
    recon_rFull = inverseMapping(recon_rFull, data_ref.brdf_ref, data_ref.epsilon, wm);
    recon_gFull = inverseMapping(recon_gFull, data_ref.brdf_ref, data_ref.epsilon, wm);
    recon_bFull = inverseMapping(recon_bFull, data_ref.brdf_ref, data_ref.epsilon, wm);

    recon_rFull(recon_rFull < 0) = 0.0;
    recon_gFull(recon_gFull < 0) = 0.0;
    recon_bFull(recon_bFull < 0) = 0.0;

    recon_rFull(nanx.nanIds) = -1;
    recon_gFull(nanx.nanIds) = -1;
    recon_bFull(nanx.nanIds) = -1;
    
    recon_rFull = reshape2merlwriter(recon_rFull);
    recon_gFull = reshape2merlwriter(recon_gFull);
    recon_bFull = reshape2merlwriter(recon_bFull);
    
    disp(['writing to ', reconFile]);
    merlWriter(reconFile, recon_rFull, recon_gFull, recon_bFull);
    
    disp('done');
    
end

