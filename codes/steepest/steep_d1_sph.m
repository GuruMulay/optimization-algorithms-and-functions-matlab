clc
clear all
clear xyz
close all
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alpha = 1 %5 itr1 % 7itr-0.6
err = 0.1
p=1

syms x y 

z =[x;y]
fsph = p.*x.^2 + 1.*y.^2;
%f(x,y)    = 100*x^2+200*y^2;
pretty(fsph)

%  figure(1)
%  ezsurfc(fsph,[-10 10])

%  [x,y]=meshgrid(-3:.125:3)
%  z=peaks(x,y)
%  meshc(x,y)

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
%plot3(z0(1,1),z0(1,2),(p.*z0(1,1).^2 + z0(1,2).^2),'m*','MarkerSize',20)

f_curr=subs(fsph, [x y], [1 3])
i=2;
m=1
j=0;
while(f_curr>err &  i<20 )
   
    j=j+1               %-------adaptive step
    if j>3 
    alpha= abs(alpha - .3)
    alpha
    end
    
    % pause
    % Gradient descent equation...........................................
    z0(i,:) = z0(i-1,:) - (alpha.*(c_ngv)')
    f_curr= p*z0(i,1).^2 + z0(i,2).^2
    
    c = subs(gradf, [x y], (z0(i,:))')
    c_bar = norm(c)
    c_ngv = c/c_bar  %actually cbar
    z0(i,:);
   
    figure(2) %-----------------------------------------------------------
    plot3(z0(i,1),z0(i,2),(p.*z0(i,1).^2 + z0(i,2).^2),'m*','MarkerSize',20)%(p.*z0(i,1).^2 + z0(i,2).^2)eqvlnt f_curr 
    %line(z0(:,1), z0(:,2))
    grid on
    hold on
    %ezsurfc(fsph,[-1 1])
    %shading flat
    colormap('cool');
    hold on
    axis square
    
    figure(3) % contour plot ---------------------------------------------
    ezcontour(fsph)
    hold on;
    plot(0,0, 'm*', 'MarkerSize', 1, 'LineWidth', 5);
    hold on;
    plot(z0(i,1),z0(i,2), 'm*', 'MarkerSize', 10, 'LineWidth', 1);
    hold on;
    
    i=i+1    
    end

   fprintf('\nno of iterations %g.  ', i )

