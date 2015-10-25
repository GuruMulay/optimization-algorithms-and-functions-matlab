%Beale
%--------------------------------------------------------------------------
clc;
clear all;
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
syms x y
%function beale(x,y) = beale(x)
beale(x,y) = (1.5-x*(1-y))^2+(2.25-x*(1-y^2))^2+(2.625-x*(1-y^3))^2;
pretty(beale(x,y))
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ezsurf(beale(x,y),[-5 5],170)
%ezsurfc(f(x,y),[-10 10])