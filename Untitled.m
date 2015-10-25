clear all
clc;
close all
[x,y] = meshgrid([-20:.2:20]); % set up 2-D plane
Z = (25*x^2)+(y^2); % plot 3rd dimension on plane
figure
surf(x,y,Z)%,gradient(Z)) % surface plot, with gradient(Z)
 % determining color distribution
colorbar % display color scale, can adjust
 % location similarly to legend