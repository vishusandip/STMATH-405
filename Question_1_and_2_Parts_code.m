%% Question 1 code for generating plot parts a and c
x1 = linspace(-1, 1, 201);
x2 = linspace(-10^(-5), 10^(-5), 201);

figure(1)
subplot(1, 2, 1)
plot(x1, f(x1), x1, (taylor_sin(x1)-x1.*taylor_cos(x1))./x1.^3);
title('(sin(x)-xcos(x))/x^3, [-1,1]');
legend('f(x)', 'Taylor approximation');

subplot(1, 2, 2)
plot(x2, f(x2), x2, (taylor_sin(x2)-x2.*taylor_cos(x2))./x2.^3);
title('(sin(x)-xcos(x))/x^3, [-10^-5,10^-5]');
legend('f(x)', 'Taylor approximation');



%% Questiton 2 code for parts a , c and e
x3 = linspace(0, 1, 101);
y = [];
for n = [1, 2, 5, 10, 20, 40]
    y = [y; x3.^n.*exp(x3)];
end
figure(2)
plot(x3, y);
title('x^ne^x');
legend('n=1', 'n=2', 'n=5', 'n=10', 'n=20', 'n=40')

I = exp(1) - 1; %% forward recursion
for n = 1:25
    val = exp(1) - n*I(n);
    I = [I, val];
end
fprintf('  n\t        I_n\n------\t-------------\n');
fprintf(' %d\t\t %1.10f\n',[(0:25); I]);

I = zeros(1, 101); %% backwards recursion 
for n = 100:-1:1
    val = (exp(1) - I(n+1))/n;
    I(n) = val;
end
fprintf('  n\t        I_n\n------\t-------------\n');
fprintf(' %d\t\t %1.10f\n',[(0:25); I(1:26)]);

%% Functions for Question 1
function y = f(x)
    y = (sin(x) - x.*cos(x))./x.^3;
end

function y = taylor_sin(x)
    y = x - x.^3/factorial(3) + x.^5/factorial(5) - x.^7/factorial(7);
end

function y = taylor_cos(x)
    y = 1 - x.^2/factorial(2) + x.^4/factorial(4) - x.^6/factorial(6);
end