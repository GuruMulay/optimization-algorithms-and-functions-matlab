clc
clear all
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alpha = 0.5
syms x y 

z =[x;y]
fsph= 1.*x.^2 + 1.*y.^2;
%f(x,y)    = 100*x^2+200*y^2;
pretty(fsph)

figure(1)
ezsurfc(fsph,[-10 10])

gv=gradient(fsph,[x y])

%z=@gv %[a1, b1] = feval(gv) %fnval( gv, [.6; 4] ) 
%F = @(xy) (xy(1).^2 - xy(2).^2) %[gr,err] = gradest(F,[.6 4])

gradf = jacobian(fsph,z).' % column gradf
hessf = jacobian(gradf,z)
pretty(hessf)

%a_eval= jacobianest(gradf,[.6 4])
c = subs(gradf, [x y], [1 3])

c_bar = norm(c)

c_ngv = c/c_bar  %actually cbar

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
z0 = zeros(100,2);
m=1
%x0(1,:) = randint(1,2,10);
z0(1,:) = [1 3]
m=2
%z0(1,:);
%plot3(z0(1,1),z0(1,2),(25.*z0(1,1).^2 + z0(1,2).^2),'m*','MarkerSize',20)

i=2;

while(i<10)
    %pause
    % Gradient descent equation..
    z0(i,:) = z0(i-1,:) - (alpha.*(c_ngv)')
    c = subs(gradf, [x y], (z0(i,:))') % current vector value 
    f_curr= 1*z0(i,1).^2 + z0(i,2).^2
 %-----------------------------------------
    m=3
    c_bar = norm(c)

    c_ngv = c/c_bar  %actually its cbar
  
    z0(i,:);
  % plot3(z0(i,1),z0(i,2),(25.*z0(i,1).^2 + z0(i,2).^2),'m*','MarkerSize',20)
   i=i+1    
end


