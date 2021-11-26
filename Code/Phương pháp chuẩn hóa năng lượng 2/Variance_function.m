function variance = Variance_function(x)
%ham tinh phuong sai
%--------------------------------------------------------------------------
% variance la phuong sai sau khi tra ve
% x = tin hieu truyen vao 
medium = Medium_function(x); %lay gia tri trung binh   
variance = 0;   %khoi tao gia tri phuong sai
N = length(x); %do dai tin hieu
for i = 1:N
    variance = variance + (x(i)-medium)*(x(i)-medium);
end
variance = variance/(N-1); 
end