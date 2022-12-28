A = [12 -1 0 0; -1 12 -1 0; 0 -1 12 -1; 0 0 -1 12];
tol = eps;
K = 100;
alpha = norm(A,1);
[v, lambda] = inverse_iteration_sp(A,alpha,K,tol);

%STMATH 405
%Simple implementation of inverse iteration
%Input: the matrix A, parameter alpha, and maximum number of iterations K, as well as a
%tolerance tol
%Output: the dominant eigenvalue and the corresponding eigenvector

function [v, lambda] = inverse_iteration_sp(A,alpha,K,tol)

n = size(A,1); %dimension of A
v = rand(n,1); v = v/norm(v); 
for k = 1:K
    v_old = v;
    v = (A-alpha*eye(n))\v;
    if rcond(A) < 1e-12
        return
    end
    v = v*sign(v(1));  %ensure first component is positive
    v = v/norm(v);
    lambda = v'*A*v; 
    alpha = lambda;
    fprintf('It #%d\t lambda = %1.5f x = ', k, lambda); 
    fprintf('%1.8f ',v);
    fprintf('\n');
    if norm(v_old-v) < tol
        return
    end
end
end