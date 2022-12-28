% problem_1_part_b_i_code
b = 17;n = 10; x = 0.06; 
for k = 1:n
    x_new = x.*(2-b.*x)
    x = x_new;
end
% problem_1_part_b_ii_code
b = 17; n = 10; xini = 0.07; xprev = 0.05; % xini is x1, and xprev is x0
for k = 1:n
    xtemp = xini + xprev -  (b.*xprev.*xini)
    xprev = xini;  % in each iteration shifting the ini value as prev value
    xini =  xtemp; % in each iteration changing the ini value as  the newly calculated temp value
end