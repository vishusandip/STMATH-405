x = linspace(0,1,51)';
y = x.*cos(exp(2*x));
v = ones(1,51);
res = 0; %initial residual

A = ones(51,1); %first column of A (constant term)
for k = 1:6
    %Plot data. 
    figure(1); subplot(2,3,k); plot(x,y,'bo'); 
    title(sprintf('k=%d',k)); hold on;
    
    %put your code here
   %trying to setup A with changing value of K
    A(:,k+1) = x.^(k);
    v = A \ y;
    res =  norm(A*v-y);
    d = ['The residual  value is ',num2str(res)];
    disp(d)
    figure(1); subplot(2,3,k); plot(x,A*v,'r*');
    hold off;
end
