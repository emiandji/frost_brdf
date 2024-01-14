function [x, estimatedSupp] = SOMPNS(Phi, Y, s, S)
%SOMPNS runs SOMP Noise Stabilization
%   INPUTS:
%       - Phi: measurement matrix
%       - Y: measurement vectors
%       - s: sparsity to enforce
%       - S: true support (needed to compute some statistics)
%       - weights: vector of weigths to be applied
%       - normalized: indicates whether the columns of Phi are already
%                     normalized (1 if normalized; 0 otherwise)
%   OUTPUTS:
%       - estimatedSupp: estimated support
%       - firstError: iteration at which the first error occured (-1 if no
%       error)

% Jean-Fran�ois Determe, 2015

    firstError = -1; % We begin with the hypothesis that no error has been 
                     % committed during the support recovery process

    [m, n] = size(Phi)
    K = size(Y,2);



    %Y = diag(weights)*Y; % Weights are applied to Y
    x = zeros(n,K);      % coefficient (output)
    x_ls = zeros(s,K);      % coefficient (output)
    R = Y; % Residual
    estimatedSupp = zeros([1 s]); % estimated support
    for z=1:s
        correlationsMatrix = R.'*Phi;

        % Working but slower
    %     correlationsMatrix = lapack('sgemm(h,h,i,i,i,s,s,i,s,i,s,S,i)', ...
    %         'T', 'N', ...
    %         K, m, n, 1, ...
    %         R, n, ...
    %         X, n, ...
    %         0, ...
    %         zeros(K, m, 'single'), K);

        if (K ~= 1)
            correlationsVector = sum(abs(correlationsMatrix));
        else % If K=1
            correlationsVector = abs(correlationsMatrix);
        end
        % kt is the index of the atom exhibiting max correlation with R
        [~, kt] = max(abs(correlationsVector));
        % Has the first error occured?
        if (firstError == -1)
    %         if (ismember(kt, S) == 0)
    %             firstError = z-1;
    %         end
            % Faster than ismember but no sanity checks and S should be sorted
            if (ismembc(kt, S) == 0)
                firstError = z-1;
            end
        end

        % support update
        estimatedSupp(z) = kt;
        estimatedSupp(1:z) = sort(estimatedSupp(1:z));

        % update residual
        buf = Phi(:,estimatedSupp(1:z));
        x_ls = (buf\Y);
        x(estimatedSupp(1:z),:) = x_ls(1:z,:);
        %x = buf*x_ls;
        % R = (eye(n) - buf*inv((buf'*buf))*buf')*Y;
        % Way faster than previous line
        R = Y - buf*x_ls;
    end

end
