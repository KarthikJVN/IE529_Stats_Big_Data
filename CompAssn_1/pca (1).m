function [U, S] = pca(X)
%PCA Run principal component analysis on the dataset X
%[U, S, X] = pca(X) computes eigenvectors of the covariance matrix of X
%Returns the eigenvectors U, the eigenvalues (on diagonal) in S

% Useful values
[m, n] = size(X);

% need to return the following variables correctly.
U = zeros(n);
S = zeros(n);

%compute the covariance matrix. Then,the "svd" function to compute 
%the eigenvectors and eigenvalues of the covariance matrix. 
% Note: When computing the covariance matrix, remember to divide by (m-1)


C = X' * X/(m-1);

[U, S, V] = svd(C);



% =========================================================================

end
