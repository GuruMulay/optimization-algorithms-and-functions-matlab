clc;
clear all;
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
syms x y

fn = x^2+2*y^2-0.8*cos(3 * pi * x) * cos(4 * pi * y)
ezsurf(fn,[-1 1],150)