clc
clear all
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

syms x y 

v = -2:0.1:2;
[x,y] = meshgrid(v)
z = x .* exp(-x.^2 - y.^2)
%[px,py] = gradient(z,.2,.2)
a=1
fsph= 25.*x.^2 + 1.*y.^2;
%f(x,y)    = 100*x^2+200*y^2;
%pretty(fsph)

figure(1)
ezsurf(fsph,[-10 10])

[px,py]=gradient(fsph,.4,6)
%z=@gv
%[a1, b1] = feval(gv)
%fnval( gv, [.6; 4] ) 

%F = @(xy) (xy(1).^2 - xy(2).^2)
%[gr,err] = gradest(F,[.6 4])