function clustering=FRWL(Z,c)
% Fast Spectral Clustering based on RandomWalk Laplacian (FRWL)
% Input:
%       - Z: the initial cross similarity matrix between data points and anchors
%       - c: the number of clusters
% Output:
%       - clustering: the cluster assignment for each point
% Requre:
% 		mySVD.m
% 		litekmeans.m
% Usage:
%       % X: d*n
%       [laKMM, laMM, AnchorGraph, Anchors, ~, ~, ~]= KMM(X', c, m,k) ;
% Reference:
%
%       C. Wang, F. Nie, R. Wang and X. Li, "Revisiting Fast Spectral Clustering with 
%       Anchor Graph," ICASSP 2020 - 2020 IEEE International Conference on Acoustics, 
%       Speech and Signal Processing (ICASSP), Barcelona, Spain, 2020, pp. 3902-3906
%
%   version 1.0 --OCT./2019 
%
%   Written by Cheng-Long Wang (ch.l.w.reason AT gmail.com)

Dv=diag(1./sum(Z,1));
U = mySVD(Z+Z*Dv,c+1);
U(:,1) = [];
U=U./repmat(sqrt(sum(U.^2,2)),1,c);
clustering=litekmeans(U,c,'MaxIter',100,'Replicates',10);