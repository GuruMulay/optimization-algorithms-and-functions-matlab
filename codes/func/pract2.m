%Rosenbrock
%--------------------------------------------------------------------------
clc;
clear all;
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
syms x y

a=2
%Rosen(x,y)= sin(x)+cos(x)+sin(y)+cos(y)
%Rosen(x,y)= sin(x)+sin(y)
%Rosen(x,y)= sin(x)+cos(y)
%Rosen(x,y)= sin(x^4)+cos(y^4)
%Rosen(x,y)= sin(x)+cos(x^2)+sin(y^2)+cos(y)
%Rosen(x,y)= sin(x)*sin(x^2)+sin(y^2)*sin(y)
%Rosen(x,y)= sin(x)*cos(x^2)+cos(y^2)*sin(y)
%Rosen(x,y)=  x^(2*a) + 200*y^(1*a) %---------ezsurfc(Rosen(x,y),[-10 10],170)

%a=2Rosen(x,y)=  x^(2*a) + 200*y^(1*a) football stadium

%Rosen(x,y)=  x^(1*a) + y^(1*a) +sin(x*y)
%Rosen(x,y)=  x^(1*a) + y^(1*a) +sin(x^2-y^2)
Rosen(x,y)=  x^(1*a) + y^(1*a) +sin(x)+sin(y)

pretty(Rosen(x,y))
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ezsurfc(Rosen(x,y),[-2 2],170)
%ezsurfc(f(x,y),[-10 10])