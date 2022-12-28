A = ugly(20);
x = ones(20,1);
b = A*x;
b(end)= 1.01;
btilde = b;
xtilde = A\btilde;
