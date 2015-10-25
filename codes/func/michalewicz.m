%michaelwicz
%--------------------------------------------------------------------------
clc;
clear all;
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
syms x y

michaelwicz(x,y)= - (sin(x) * (sin(1 * x^2/pi))^(2 * 15)) - (sin(y) * (sin(2 * y^2/pi))^(2 * 15))
pretty(michaelwicz(x,y))
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
figure(1)
ezsurf(michaelwicz(x,y),[-17 17],170)
%ezsurfc(f(x,y),[-10 10])

%DIFF~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
pretty(diff(michaelwicz(x,y),x))
figure(2)
ezsurf(diff(michaelwicz(x,y),x),[-10 10],170)