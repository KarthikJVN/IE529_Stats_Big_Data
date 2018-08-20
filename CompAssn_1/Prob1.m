clc
clear all
load('PCA_comp1')
X = PCA_comp1;

%Observations/Sample = M | Dimentions/features = N | X = MxN
[M,N] = size(X);
%% PART 1-3
%De-meaning data
mu = mean(X);
X_dm = bsxfun(@minus, X, mu);

%Run PCA
[U, S] = pca(X_dm);
eigval = diag(S);

%Significant Eigen vectors Extraction
Sigificant_dimensions = ExtractSignificantEig(eigval, 0.95);

%Project Data
Z = projectData(X_dm, U, Sigificant_dimensions);


plot(Z(:,1),Z(:,2), 'o')

display('Press enter to go to the next part of the problem')
pause;

%% PART 4

%De-meaning data
mu = mean(X);
X_norm = bsxfun(@minus, X, mu);

%scaling with standered deviation
sigma = std(X_norm);
X_norm = bsxfun(@rdivide, X_norm, sigma);

%Run PCA
[U, S] = pca(X_norm);
eigval = diag(S);

%Significant Eigen vectors Extraction
Sigificant_dimensions = ExtractSignificantEig(eigval, 0.95);

%Project Data
Z = projectData(X_norm, U, Sigificant_dimensions);

plot(Z(:,1),Z(:,2), 'o')
