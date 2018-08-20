%q1
load('PCA_comp1.mat');
[X_norm,mu,sigma] = Normalization(X);
[U,S] = pca(X_norm);

%Normalization function: perform normalization to the input data
function[X_norm,mu,sigma] = Normalization(X)
%Compute the column mean
mu = mean(X);
%subtract column mean from original matrix
X_norm = bsxfun(@minus, X, mu);
%Compute sigma
sigma = std(X_norm);
%divide the normalized matrix by sigma
%X_norm = bsxfun(@rdivide, X_norm, sigma)
end
% pca function: perform PCA
function[U,S] = pca(X)
[m,n] = size(X);
Y = (1/(m-1))*X'*X;
[U,S,V] = svd(Y);
end

%q2
proportion = zeros(size(S,1),1);
denominator = sum(sum(S));

%Compute the proportion of retained variance
for i = 1:size(S,1)
    I = ones(i,1);
    numerator = sum(S(1:i, 1:i)*I);
    proportion(i) = numerator/denominator;
end

%display the proportion matrix
disp(proportion);

%q3
Ureduce = U(:,1:2);   %reschedule the number of principal components
z = X_norm*Ureduce;   %generate the projection Z
scatter(Z(:,1),Z(:,2)); %plot the scatter plot

%q4
load('PCA_comp1.mat');  %Load raw data into MATLAB
[X_norm, mu, sigma] = Normalization(X); %First, normalize X
[U,S] = pca(X_norm);

%Normalization function: perform normalization to the input data
function[X_norm, mu, sigma] = Normalization(X)
%Compute the column mean
mu = mean(X);

%subtract column mean from original matrix
X_norm = bsxfun(@minus, X, mu);

%compute sigma
sigma = std(X_norm);

%divide the normalized matrix by sigma
X_norm = bsxfun(@rdivide, X_norm, sigma);
end

disp(U);
disp(S);

%pca function: perform PCA
function[U,S] = pca(X)
[m,n] = size(X);
Y = (1/(m-1))*X'*X; %Compute covariance matrix 
[U,S,V] = svd(Y);   %Perform SVD on covariance matrix
end

proportion = zero(size(S,1),1);
denominator = sum(sum(S));

%Compute the proportion of retained variance
for i = 1:size(S,1)
    I = ones(i,1);
    numerator = sum(S(1:i, 1:i)*I);
    proportion(i) = numerator/denominator;
end

%display the proportion matrix
disp(proportion);

Ureduce = U(:,1:2);
Z = X_norm*Ureduce;
scatter(Z(:,1),Z(:,2));



