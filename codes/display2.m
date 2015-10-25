% *The Step-Numbers (1,2,...11.16, 11.17) are with reference to the report
clear all
clc
format long
% ********************************(1)************************************
no_of_values = 1;
T = .03;
Q = 1
h = 0.001; % NEW parameter Added
x1 = zeros(1,100);
x2 = zeros(1,100);
xy_cord = zeros(2,100);
% h = zeros(1,100);
L = zeros(1,100);
M = zeros (1,100);
% ********************************(2)************************************
syms x y % Symbols are defined   % h REMOVED
% ********************************(3)***********************************
% for cnt_1 = 1:1:no_of_values
%     f = 0;
%     f = -((sin(x) * (sin(1 * x^2/pi))^(2 * 10)) + (sin(y) * (sin(2 * y^2/pi))^(2 * 10))) + ...
%         T * (x^2 + 2 * y^2 - 0.3 * cos(3 * pi * x) * cos(4 * pi * y) + 0.3);
% 
%     f_add(cnt_1,1) = f;
% end
minfun = -Q*((sin(x) * (sin(1 * x^2/pi))^(2 * 10)) + (sin(y) * (sin(2 * y^2/pi))^(2 * 10))) + ...
        T * (x^2 + 2 * y^2 - 0.3 * cos(3 * pi * x) * cos(4 * pi * y) + 0.3); % Define the function to minimize

pretty(minfun)    

display(T)
%display(minfun)

ezsurf(minfun,150)