clc;
clear all;
close all;
load('PCA_comp1.mat');
[U_orig,S_orig,V_orig] = svd(PCA_comp1);
[m,n] = size(PCA_comp1);
mu = mean(PCA_comp1,2); % compute the mean(s)
X = (PCA_comp1 - repmat(mu,1,n)); % de-biased, scaled data
covar = X * X'; % compute the covariance matrix including the scaling 1/(n-1)
[V_temp,D_temp] = eig(covar); % compute an eigenvalue decomposition
[D_vec,indx] = sort(diag(D_temp),'descend'); %sort eigenvalues in descending order
sel_ind = find(D_vec>1e-5);  % select non-zero eigenvalues
D = diag(D_vec(sel_ind)); % sorted and selected eigenvalue matrix
V = V_temp(:,indx(sel_ind)); % sorted and selected eigenvector matrix
X_pca = V' * X;
VV = V_temp(:,indx);
X_ppca = VV' * X;

figure(1)
subplot(1,2,1);
scatter3(X(1,:),X(2,:),X(3,:)) % scatter de-biased, scaled data
title('De-biased, scaled data points')
xlabel('feature 1'); ylabel('feature 2'); zlabel('feature 3');
subplot(1,2,2);
scatter3(X_ppca(3,:),X_ppca(2,:),X_ppca(1,:))
title('PCA results for de-biased, scaled data points in 3D')
xlabel('feature 1'); ylabel('feature 2'); zlabel('feature 3');

figure(2)
scatter(X_pca(1,:),X_pca(2,:))
title('PCA results for de-biased, scaled data points in 2D')
xlabel('feature 3'); ylabel('feature 2');

