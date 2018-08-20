%q3 for regression analysis
%Case 2 Polynomial Regression
%Load data
load('Comp1_IE529.mat');
X = lift_kg';
y = putt_m';

p = polyfit(X, y, 2);
pred = polyval(p,X);

residual = [pred - y]'*[pred - y];

t2 = 0:0.1:max(X);
y2 = polyval(p,t2);
plot(X,y,'o',t2,y2)

legend('Training data', 'Polynomial regression');

%Regression analysis 
%1
%Case 1: Linear Regression
load('Comp1_IE529.mat');
X = lift_kg';
y = putt_m';

[beta,sigma,r] = ols(y,[ones(size(X,1),1)])

Output

%Case 2: Polynomial Regression
load('Comp1_IE529.mat');
X = lift_kg';
y = putt_m';
residual = zeros(15,1);

for i = [2 3 4 5 6 7 8 9 10 11 12 13 14]
    p = polyfit(X,y,i);
    pred = polyval(p,X);
    
    residual(i) = [pred - y]'*[pred - y];
end

residual

%q3
%Case 1: Linear regression
plotDataLR(X,y);
%plot the linear fit
hold on;
plot(X,[ones(size(X,1),1)X]*beta,'-');
legend('Training data','Linear regression')
hold off

function plotDataLR(x,y)
figure;
load('Comp1_IE529.mat');
X = lift_kg';
y = putt_m';
m = length(y);
plot(x,y,'rx','MarkerSize',10);
end

%Case 2: Polynomial Regression
%Load data

