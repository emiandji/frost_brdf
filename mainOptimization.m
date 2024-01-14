% This work © 2023 by Ehsan Miandji is licensed under CC BY-NC-SA 4.0 
% svdMat : training mat file.
% npca : number of samples we want.
% locationFile : '.mat' file

% optimTime : in seconds
% Q matrix is normalized before doing the SOMP optimization.
function [optimTime] = mainOptimization(svdMat, npca, nlocation, samplingFile)


    loadedsvd = load(svdMat);

    % psuedo-inverse of Q is inv(S)*inv(U) = inv(S)*Ut
    Q = pinv(loadedsvd.S(1:npca,1:npca))*loadedsvd.U(:,1:npca)';
    Vt = loadedsvd.V';
    Vt = Vt(1:npca,1:npca);
    disp('Q is ready !');

    % Normalize Q 
    clear loadedsvd
    Q = NormalizeColumns(Q);
    disp('Q is normalized.');

    % doing optimization with SOMP
    disp('doing SOMP...');
    tStart = tic; 
    [output, nzl] = SOMPNS(Q, Vt, nlocation, []);
    tEnd = toc(tStart)
    optimTime = tEnd;
    disp('done SOMP...');

    % saving locations
    nzl = nzl';

    save(samplingFile, 'nzl', 'npca');
    disp('done saving locations ...');


end


