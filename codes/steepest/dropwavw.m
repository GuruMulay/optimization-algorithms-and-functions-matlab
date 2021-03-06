%drop wave
%--------------------------------------------------------------------------
clc;
clear all;
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
syms x y

dropwave(x,y)= (1+cos(12*sqrt(x^2+y^2))) / (0.5*(x^2+y^2) + 2)
pretty(dropwave(x,y))
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ezsurf(dropwave(x,y),[-5 5],170)
%ezsurfc(f(x,y),[-10 10])