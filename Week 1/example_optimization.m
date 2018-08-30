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

% figure(1), subplot(2,1,1), surf(X, Y, objective_function), colorbar
% xlabel('X = [0,4]'), ylabel('Y = [0,2]'), zlabel('X^2 + Y^2'), title('conditions manually calculated')
% subplot(2,1,2), plot(1:length(objective_function(:)), objective_function(:), 'b'), ylabel('X^2 + Y^2'), hold on
% scatter(Idx, min(objective_function(:)), 'ro', 'filled'), grid on



%% Approach 2 (conditions calculated by MATLAB)

v = -10:0.1:25;
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

% figure(2), subplot(2,1,1), surf(X, Y, objective_function), colorbar
% xlabel('X'), ylabel('Y'), zlabel('X^2 + Y^2'), title('conditions calculated by MATLAB')
% subplot(2,1,2), plot(1:length(objective_function(:)), objective_function(:), 'b'), ylabel('X^2 + Y^2'), hold on
% scatter(Idx, min(objective_function(:)), 'ro', 'filled'), grid on

figure(2), surf(X, Y, objective_function), colorbar, view(0,90)
xlabel('X > 0'), ylabel('Y > 0'), zlabel('X^2 + Y^2'), title('map of x^2 + y^2')


%% approach 3 (using plot functions)

x = -10:0.1:10;

y1 = 2 - (x/3);
y2 = 4 - x;

figure(3), plot(x,y1,'r', x,y2,'b'), legend('x+3y \geq 6', 'x+y \geq 4'),
xlabel('x > 0'), ylabel('y > 0'), xlim([0 inf]), ylim([0 inf]), grid on


%% approach 4 (using contourf function)
% axis values incorrect, colors incorrect

v = -10:0.1:25;
[X,Y] = meshgrid(v);

ineq1 = X + 3*Y >= 6;    % First inequation
ineq2 = X + Y >= 4;      % Second inequation
both = ineq1 & ineq2;    % logical 1's and 0's

% figure(4), hold on
% c = 1:3;                                   % Contour levels
% contourf(c(1) * ineq1, [c(1), c(1)], 'b')  % Fill area for first inequation
% contourf(c(2) * ineq2, [c(2), c(2)], 'g')  % Fill area for second inequation
% contourf(c(3) * both, [c(3), c(3)], 'r')   % Fill area for both inequations
% legend('First', 'Second', 'Both')
% xax = X(1,:);
% yax = Y(:,1);
% xlim([0 inf]), ylim([0 inf])
% set(gca, ...                               %# Fixing axes ticks
%     'XTickLabel', {X(get(gca, 'XTick'))}, ...
%     'YTickLabel', {Y(get(gca, 'YTick'))})