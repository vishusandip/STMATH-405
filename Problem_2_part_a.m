format long 
n=1e8;
s = 1;
sum_backward = 0;
for k =1:1e8
  s = s  + 1/k/(k+1);
end


for k = 1e8:-1:1
    sum_backward = sum_backward  + 1/k/(k+1);
end


fprintf('%s%4i\n','       summation with forward method: ',s);
disp(s);
disp(sum_backward+1);
