% Examples 1.2--1.3 and Figure 1.3

x = 3;
delta = 1e-11;
i = -20:1:0;
h = 10.^i;
g1 = (cos(x+h)-cos(x))./h +sin(x);              %1st estimate of value of the function at x=3 and delta =  1e-11
g2 = (-2).*sin(x+(h/2)).*sin(h/2) +sin(x) ;   %2nd estimate of value of the function at x=3 and delta =  1e-11
err1 = abs (g1 - sin(x)); %calculates the absolute error between fp and the derivative approximation
err2 = abs (g2 - sin(x));

%plot the actual error and the predicted error on a log-log plot.
loglog (h,err1,'-*');
hold on
loglog (h,err2,'r-.');
xlabel('h')
ylabel('Absolute error')
axis([10^(-20) 1 10^(-15) 1])
hold off;