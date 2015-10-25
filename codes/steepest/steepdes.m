function [x,F,g] = steepdes(Fname,x0,print)
%	STEEPDES(Fname,x,print) finds a local minimizer of f(x)
%       using the method of steepest descent and a backtracking linesearch.
%       Fname is a string containing the name of a M-file
%       that computes the function  f.  
%       x0 is an initial guess at the minimizer.  
%       
%       For example, STEEPDES( 'my_function',x0 ) minimizes a 
%       function defined in the M-file my_function.m. 
%       BE SURE TO PUT THE FUNCTION NAME IN SINGLE QUOTES.
%
%       The function and gradient of f(x) must be 
%       defined in an M-file containing a function with 
%       specification  [f,g] = my_function(x)
%
%	Putting 1 for the value of print results in one line
%	of output at each iteration giving the iteration, the
%	total number of function evaluations made so far, the step
%	taken in the linesearch, the objective value and the norm
%	of the gradient.
%
%       BEWARE! This M-file was written to demonstrate how bad the method of
%       steepest descent really is.  Use only for pedagogical purposes.

%       First version dated 23-Sep-1989.
%       Philip E. Gill, University of California, San Diego.
%	Modified by Walter Murray, October 1995.
if nargin < 3                   
   print = 0;                      
end

[n,m]     = size(x0);

iteration_limit = 25;  
jmax            = 20;

mu        = 1/4;                               
dxmax     = 1;
tol       = sqrt(eps);           
                 
k         = 0;
nf        = 0;
step      = 0;
status    = '          ';

x         = x0;                                                   

[F,g]     = feval( Fname,x );
        
if print
   clc
   fprintf( ' Itn   Nf      Step      Objective    norm g\n' ) 
   str1 = sprintf ( ' %3g %4g %9.2e', k, nf, step );
   str2 = sprintf ( ' %14.7e %9.2e  ', F, norm( g ) );
   disp( [str1 str2 ] )
end           

while  norm(g) >= tol  &  k < iteration_limit
   p     = - g;
   gtp   =   g'*p;
   j     =   1;                         
   step  =   min( 1,dxmax/norm( p ) );
              
   while feval( Fname,x+step*p ) > F + step*mu*gtp &  j <= jmax
      step = step/2;
      j    = j + 1;
   end  

   nf    = nf + j;

   if j > jmax
      status  = 'j too big ';
      break
   end

   x      = x +  step*p;
   [F,g]  = feval( Fname,x );
   k      = k + 1;

   if print                                           
      str1 = sprintf ( ' %3g %4g %9.2e', k, nf, step );
      str2 = sprintf ( ' %14.7e %9.2e  ', F, norm( g ) );
      disp( [str1 str2 ] )
   end
end
if k >= iteration_limit,
   status = 'k too big ';
end 
              
if     status == 'k too big '
   fprintf( '\nQN terminated.  Iteration limit exceeded\n\n' )
elseif status == 'j too big '
   fprintf( '\nQN terminated.  Too many backtracking steps.\n\n' ) 
else
   fprintf(    '\nOptimal at iteration %g.  ', k )
   fprintf(    '  Objective = %14.7e\n', F );
end
