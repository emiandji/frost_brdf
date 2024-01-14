function [Xnew] = NormalizeColumns(X)
%NormalizeColumns normalizes the columns of X so that each of them exhibit
%an \ell_2 norm equal to 1
%   INPUTS:
%       - X
%   OUTPUTS:
%       - Xnew: Normalized matrix

Xnew = X;
for z=1:size(X,2)
    Xnew(:,z) = X(:,z)/norm(X(:,z),2);
end

end