clc; clear all; close all;
load('PCA_comp1.mat');
[n,m] = size(PCA_comp1);
Mean_col = mean(PCA_comp1);
demean_data = PCA_comp1 - repmat(Mean_col,n,1); 
std_col = std(PCA_comp1);
std_data = demean_data./repmat(std_col,n,1);

%% Method 1
% For demean_data
Cov = demean_data'*demean_data;
[V_temp,D_temp] = eig(Cov);
[D_vec,indx] = sort(diag(D_temp),'descend');
D = diag(D_vec); 
V = V_temp(:,indx); % sorted eigenvectors
X_pca = demean_data * V;
var_pca = var(X_pca);
por_var = var_pca/sum(var_pca);

% For std_data
Cov_std = std_data'*std_data;
[V_tempstd, D_tempstd] = eig(Cov_std);
[D_vecstd,indx_std] = sort(diag(D_tempstd),'descend');
D_std = diag(D_vecstd);
V_std = V_tempstd(:,indx_std); % sorted eigenvectors
Xstd_pca = std_data * V_std;
varstd_pca = var(Xstd_pca);
porstd_pca = varstd_pca/sum(varstd_pca);


%% Method 2

%For demean_data 
% coeff: sorted eigenvectors(= V)
% score: projected data (=X_pca)
% latent: variance of projected data(= var_pca)
[coeff,score,latent] = pca(demean_data);
por_lat = latent/sum(latent); % =por_var

%For std_data
[coeff_std,score_std,latent_std] = pca(std_data);
porstd_lat = latent_std/sum(latent_std); % =porstd_var

%%Plot for demean_data
clt_x1 = X_pca(X_pca(:,1)<-2,1);
clt_y1 = X_pca(X_pca(:,1)<-2,2);
clt_x2 = X_pca(X_pca(:,1)>-2,1);
clt_y2 = X_pca(X_pca(:,1)>-2,2);

figure(1)
plot(clt_x1,clt_y1, 'ob'); hold on;
plot(clt_x2,clt_y2, 'or');
title('2D graph of first 2 PCs for de-meaned data')
xlabel('PC1'); ylabel('PC2');

% figure(2)
% plot(clt_x1,zeros(length(clt_x1),1),'ob'); hold on;
% plot(clt_x2,zeros(length(clt_x2),1),'or');

%% Plot for std_data
cltstd_x1 = Xstd_pca(Xstd_pca(:,1)<-1,1);
cltstd_y1 = Xstd_pca(Xstd_pca(:,1)<-1,2);
cltstd_x2 = Xstd_pca(Xstd_pca(:,1)>-1,1);
cltstd_y2 = Xstd_pca(Xstd_pca(:,1)>-1,2);

figure(2)
plot(cltstd_x1,cltstd_y1,'ob'); hold on;
plot(cltstd_x2,cltstd_y2,'or'); 
title('2D graph of first 2 PCs for standardized data')
xlabel('PC1'); ylabel('PC2');
