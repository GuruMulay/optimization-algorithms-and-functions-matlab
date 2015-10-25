%spherical funtion % De Jong's
%--------------------------------------------------------------------------
clc;
clear all;
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
syms x y

f_sph(x,y)= 10*x^2+10*y^2;
f(x,y)    = 100*x^2+200*y^2;
pretty(f(x,y))
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
figure(1)
ezsurf(f_sph(x,y),[-10 10])
ezsurfc(f_sph(x,y),[-10 10])
figure(2)
ezsurf(f(x,y),[-10 10])
%ezsurfc(f(x,y),[-10 10])
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

%handle_f=@f_sph(x,y)
z_min=fminbnd(f_sph(x,y),-1,1)