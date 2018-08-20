clc; clear all; close all;
load('Comp1_IE529.mat');

[x1, ind] = sort(lift_kg);
x2 = putt_m(ind);
%% Linear regression
% [w1, S1] = polyfit(x1, x2,1);
% y1 = polyval(w1,x1);

X1 = [ones(length(x1),1),x1'];
w1 = inv(X1'*X1)*X1'* x2';
y1 = X1 * w1;
sq_loss1 = sum((y1 - x2').^2);

%% 2nd-order Polynomial regression

% [w2, S2] = polyfit(x1,x2,2);
% y2 = polyval(w2,x1);
X2 = [ones(length(x1),1),x1',(x1.^2)'];
w2 = inv(X2'*X2)*X2'* x2';
y2 = X2 * w2;
sq_loss2 = sum((y2 - x2').^2);

%% 3rd-order Polynomial regression
% [w3, S3] = polyfit(x1,x2,3);
% y3 = polyval(w3,x1);

X3 = [ones(length(x1),1),x1',(x1.^2)', (x1.^3)'];
w3 = inv(X3'*X3)*X3'* x2';
y3 = X3 * w3;
sq_loss3 = sum((y3 - x2').^2);


%% 4rd-order Polynomial regression
% [w4, S4] = polyfit(x1,x2,4);
% y4 = polyval(w4,x1);

X4 = [ones(length(x1),1),x1',(x1.^2)', (x1.^3)',(x1.^4)'];
w4 = inv(X4'*X4)*X4'* x2';
y4 = X4 * w4;
sq_loss4 = sum((y4 - x2').^2);
figure(1)
subplot(2,2,1);
plot(x1,x2,'bo',x1, y1, 'r-');
xlabel('x1[-kg]'); ylabel('x2[-m]');
title('Linear Regression');
subplot(2,2,2);
plot(x1,x2,'bo', x1, y2, 'r-');
xlabel('x1[-kg]'); ylabel('x2[-m]');
title('Polynomial Regression (2nd-order)');

subplot(2,2,3);
plot(x1,x2,'bo', x1, y3, 'r-');
xlabel('x1[-kg]'); ylabel('x2[-m]');
title('Polynomial Regression (3rd-order)');


subplot(2,2,4);
plot(x1,x2,'bo', x1, y4, 'r-');
xlabel('x1[-kg]'); ylabel('x2[-m]');
title('Polynomial Regression (4th-order)');

figure(2)
bar([1,2,3,4],[sq_loss1,sq_loss2,sq_loss3,sq_loss4],0.3)
xlabel('model'); ylabel('Sum of squared errors');
title('Comparison of sum-of-square residuals')


% %% Logistic regression
% Unable to compile since the none of two vectors contains only integers
% B=mnrfit(x1,x2);
% % B = glmfit(x1, [x2 ones(length(x2),1)], 'binomial','link','logit');
% Z = B(1) + x1 * B(2);
% Y_hat = 1 ./ (1 + exp(-Z));
% 
% figure(6)
% plot(x1,x2,'bo', x1, Y_hat, 'r-');
% xlabel('x1[-kg]'); ylabel('x2[-m]');
% title('Logistic Regression');
