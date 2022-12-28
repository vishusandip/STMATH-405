N = 127; h = 1/(N+1); t = h:h:1-h;
A = 1./h.^2*(diag(2*ones(N,1))-diag(ones(N-1,1),1) - diag(ones(N-1,1),-1));
g = -4*pi^2*cos(2*pi*t)'; 
utrue = 1-cos(2*pi*t)';

%plot(t,utrue,'k-','LineWidth',2); 
hold on;

%put your code here

%% Jacobi method
M = diag(diag(A)); x1 = zeros(127,1);
n = 5000;

for k = 1:n
    x1 = x1 + M\(g-A*x1);
end

%% GS method
M = tril(A); x2 = zeros(127,1);
n = 5000;

for k = 1:n
    x2 = x2 + M\(g-A*x2);
end

%% SOR method
D = diag(diag(A));
L = -tril(A,-1);
U = -triu(A,1);
omega = 1.952093233850047;
a = (D-omega*L);
%M = tril(A)+ (1/1.952093233850047)*D; 
% with this M the curve somehow is equally worse as Jacobi Method, I am
% screwing up some calculations of M,  I tried multiple versions but
% nothing worked so I changed the code to do construction of A  from
% scratch with L, D and U
x3 = zeros(127,1);

n = 5000;

for k = 1:n
    %x3 = x3 + M\(g-A*x3);
    x3 = a\(((1-omega)*D + omega*U)*x3) + omega*(a\g); 
end

plot(t,utrue,'k-','LineWidth',2)
plot(t,x1,'^-r')
plot(t,x2,'V-b')
plot(t,x3,'s-g')
legend('True curve','Jacobi Method curve','GS Method curve','SOR Method curve')

hold off;