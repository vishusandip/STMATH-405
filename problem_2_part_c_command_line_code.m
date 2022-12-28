f = @(x) cos(x);
fp = @(x) -sin(x);
fpp = @(x) -cos(x);
P = [1;1];
x0 = 0.5;
tol = 1e-20;
N = 20;
min_dist_modified(f,fp,fpp,P,x0,tol,N)
%  n	      x			      f(x) 	
%---------	-----------------	-----------------	
%   1	8.30005585e-01	6.74871638e-01
%   2	7.90362450e-01	7.03587802e-01
%   3	7.89781523e-01	7.04000495e-01
%   4	7.89781396e-01	7.04000585e-01
%   5	7.89781396e-01	7.04000585e-01
%   6	7.89781396e-01	7.04000585e-01

% ans =

%   0.789781395620860
%   0.704000585169450