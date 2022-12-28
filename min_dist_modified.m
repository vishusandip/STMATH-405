%Function to compute the closest point on the graph of y=f(x) to the
%point P = (a,b) using Newton's method.
%Input: f (function handle to evaluate f)
%       fp (function handle to evaluate f')
%       fpp (function handle to evaluate f'')
%       P   (the point P, specified as a column vector P = [a;b]
%       x0 (initial guess for x)
%       tol (tolerance for Newton's method)
%       N (max number of iterations for Newton's method)
%Output:    Q (co-ordinates of the closest point (x,f(x)) as a column
%           vector.

function Q = min_dist_modified(f,fp,fpp,P,x0,tol,N)

%put your code here! You need to implement the iteration  you found in part
%(a). You can use newtons.m, or implement the iteration itself directly

its = 0;                %number of iterations run so far
fx = f(x0); fpx = fp(x0); fppx = fpp(x0); %compute the first values of f and fp
x = x0; x_old = inf;    %we set x_old to inf initially so that the while loop will run.
xarray = [x];             %store the iteration history so that we can examine convergence
a = P(1);
b = P(2);

while ( abs(x-x_old) > tol && its < N)
    x_old = x;
    x = x - (x-a+(fpx.*fx)-(b.*fpx))/(1+(fpx.*fpx)+(fppx.*fx)-(b.*fppx));             %update x
    fx = f(x); fpx = fp(x); fppx = fpp(x);     %update f and fp
    xarray = [xarray x];
    if (its < 1)
    fprintf('   n\t      x\t\t\t      f(x) \t\n');
    fprintf('---------\t-----------------\t-----------------\t\n')
    end 
    if ( abs(fx)< 1e-20)
            its = its+1;
            return
    end
    its = its+1;
Q = [x;f(x)];       %returns the answer, where x is the output from Newton's method.
%fprintf('   %d\t%1.8e\t%1.8e\t\t%1.8e\t\t%1.8e\n',its,x,fx);   %print the last line after the loop exits
fprintf('   %d\t%1.8e\t%1.8e\n',its,x,fx);
end
%Q = [x;f(x)]
end