%michaelwicz
%--------------------------------------------------------------------------
clc;
clear all;
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
t=2.1395e-08

%point of dominance 10^-1;
p=1
q=1

syms x y

michaelwicz_sph(x,y)= - (sin(x) * (sin(1 * x^2/pi))^(2 * 10)) - (sin(y) * (sin(2 * y^2/pi))^(2 * 10))...
                  + t * (p*x^2 + q*y^2);

pretty(michaelwicz_sph(x,y))
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
figure(4)
ezsurf(michaelwicz_sph(x,y),[-30 30],170)
%ezsurfc(f(x,y),[-10 10])

%DIFF~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
pretty(diff(michaelwicz_sph(x,y),x))
%figure(2)
%ezsurf(diff(michaelwicz(x,y),x),[-10 10],170)