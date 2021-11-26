function medium = Medium_function(x)
%ham tinh gia tri trung binh
%--------------------------------------------------------------------------
% medium la gia tri trung binh sau khi tra ve
% x la tin hieu truyen vao
medium = 0;  %khoi tao gia tri trung binh
for i = 1:length(x)%Tinh gia tri trung binh
    medium = medium+x(i);
end
medium = medium/length(x);
end