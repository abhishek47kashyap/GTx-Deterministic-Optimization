clear all
close all
clc

%% Approach 1 (conditions calcuated manually)
% (most likely incorrect)
x = 0: 0.1: 4;
y = 0: 0.1: 2;
[X,Y] = meshgrid(x,y);

objective_function = X.^2 + Y.^2;

[app1.min_val, Idx] = min(objective_function(:));
[app1.min_row, app1.min_col] = ind2sub(size(objective_function), Idx);

app1.min_val_x = X(app1.min_row, app1.min_col);
app1.min_val_y = Y(app1.min_row, app1.min_col);

figure(1), subplot(2,1,1), surf(X, Y, objective_function), colorbar
xlabel('X = [0,4]'), ylabel('Y = [0,2]'), zlabel('X^2 + Y^2'), title('conditions manually calculated')
subplot(2,1,2), plot(1:length(objective_function(:)), objective_function(:), 'b'), ylabel('X^2 + Y^2'), hold on
scatter(Idx, min(objective_function(:)), 'ro', 'filled'), grid on



%% Approach 2 (conditions calculated by MATLAB)

v = -10:0.5:25;
[X,Y] = meshgrid(v);

conditions = (X + 3*Y >= 6) & (X + Y >= 4) ...
             & (X >= 0) & (Y >= 0);   % contains logical 0's and 1's
         
conditions = double(conditions);
conditions(conditions == 0) = NaN;

X = X .* conditions;
Y = Y .* conditions;

objective_function = X.^2 + Y.^2;

[app2.min_val, Idx] = min(objective_function(:));
[app2.min_row, app2.min_col] = ind2sub(size(objective_function), Idx);

app2.min_val_x = X(app2.min_row, app2.min_col);
app2.min_val_y = Y(app2.min_row, app2.min_col);

figure(2), subplot(2,1,1), surf(X, Y, objective_function), colorbar
xlabel('X'), ylabel('Y'), zlabel('X^2 + Y^2'), title('conditions calculated by MATLAB')
subplot(2,1,2), plot(1:length(objective_function(:)), objective_function(:), 'b'), ylabel('X^2 + Y^2'), hold on
scatter(Idx, min(objective_function(:)), 'ro', 'filled'), grid on
