clc
clear all
clear xyz
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alpha = 3           % 5 itr1 % 7itr-0.6
e = 1000            % Random High
err = 0.01
T = 10              % 0.1 %point of dominance 10^-1;
p = 1
q = 1
%------ starts at -------|
a = 20                  %|
b = -30                 %|
%------------------------|
syms x y 

z =[x;y]
f_min = -((sin(x) * (sin(1 * x^2/pi))^(2 * 10)) + (sin(y) * (sin(2 * y^2/pi))^(2 * 10))) + ...
        T * (p*x^2 + q*y^2);

pretty(f_min)

% figure(1)
% ezsurfc(f_min,[-10 10])

                                        %  [x,y]=meshgrid(-3:.125:3)
                                        %  z=peaks(x,y)
                                        %  meshc(x,y)

gv=gradient(f_min,[x y])

                                        %z=@gv %[a1, b1] = feval(gv) %fnval( gv, [.6; 4] ) 
                                        %F = @(xy) (xy(1).^2 - xy(2).^2) %[gr,err] = gradest(F,[.6 4])

gradf = jacobian(f_min,z).'             % column gradf
hessf = jacobian(gradf,z)
pretty(hessf)

%a_eval= jacobianest(gradf,[.6 4])
c = subs(gradf, [x y], [a b])

c_bar = norm(c)  %root-square
c_ngv = c/c_bar  %actually cbar

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
z0 = zeros(100,2);
m=1
                                         %x0(1,:) = randint(1,2,10);
z0(1,:) = [a b]
m=2
%z0(1,:);
%plot3(z0(1,1),z0(1,2),(p.*z0(1,1).^2 + z0(1,2).^2),'m*','MarkerSize',20)

f_curr=subs(f_min, [x y], [a b])
i=2;
m=1
j=0;

while(e>err &  i<30)
    
    j=j+1                 %-------adaptive step for T
    if j>3 
    T= abs(T - 0.55*T)
    T
    end
    %ezsurfc(f_min,[-10 10])
   
%     j=j+1               %-------adaptive step for alpha
%     if j>3 
%     alpha= abs(alpha - .3)
%     alpha
%     end
    
    % pause
    % Gradient descent equation...........................................
    
    z0(i,:) = z0(i-1,:) - (alpha.*(c_ngv)')
    f_curr= -((sin(z0(i,1)) * (sin(1 * z0(i,1)^2/pi))^(2 * 10)) - (sin(z0(i,2)) * (sin(2 * z0(i,2)^2/pi))^(2 * 10))) + ...
              T * (p*z0(i,1)^2 + q*z0(i,2)^2)
    
    c = subs(gradf, [x y], (z0(i,:))')      % finds slope 
    e = norm(c)                             % mod of--->|slope| 
    c_bar = norm(c)
    c_ngv = c/c_bar;                        % actually cbar
    z0(i,:);
   
    figure(2) %-----------------------------------------------------------
    plot3(z0(i,1),z0(i,2),f_curr,'m*','MarkerSize',20)
    %line(z0(:,1), z0(:,2))
    grid on
    hold on
    ezsurfc(f_min,[-30 30])
    shading flat
    colormap('cool');
    hold on
    axis square
    
    figure(3) % contour plot ---------------------------------------------
    ezcontour(f_min,[-50 50 -50 50])
    hold on;
    plot(0,0, 'm*', 'MarkerSize', 1, 'LineWidth', 5);
    hold on;
    axis([-50 50 -50 50])
    plot(z0(i,1),z0(i,2), 'm*', 'MarkerSize', 10, 'LineWidth', 1);
    hold on;
    
    
    f_min = -((sin(x) * (sin(1 * x^2/pi))^(2 * 10)) + (sin(y) * (sin(2 * y^2/pi))^(2 * 10))) + ...
    T * (p*x^2 + q*y^2);
    figure(1)
    ezsurfc(f_min,[-30 30],170)
    
    i=i+1    
end
   %----------------------------------------------------------------------
   fprintf('\nno of iterations %g.  ', i )
 T  
 f_min = -((sin(x) * (sin(1 * x^2/pi))^(2 * 10)) + (sin(y) * (sin(2 * y^2/pi))^(2 * 10))) + ...
        T * (p*x^2 + q*y^2);
 figure(1)
 ezsurfc(f_min,[-30 30],170)


