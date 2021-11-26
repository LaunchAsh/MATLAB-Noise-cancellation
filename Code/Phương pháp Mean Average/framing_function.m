function [frames] = framing_function(x,fs,f_d)
%Ham chia khung chong
%--------------------------------------------------------------------------
%[frames] = framing_function(x,fs,f_d)
%frames : mang luu khung da chia
%x : tin hieu dau vao
%f_d : do dai khung tin hieu
f_size = floor(f_d * fs);   %so luong mau trong 1 khung
l_s = length(x);            %do dai tin hieu
n_f = floor(l_s/f_size);    %so luong khung duoc chia theo do dai tin hieu
temp = 0;
%khung le chua cac khung duoc chia tu 0
for i = 1 : n_f
    frames(2*i-1,:) = x(temp + 1 : temp + f_size);
    temp = temp + f_size;
end
%khung chan chua cac khung duoc chia tu 1 nua do dai 1 khung
temp = f_size/2;
for i = 2 : n_f
    frames(2*(i-1),:) = x(temp + 1 : temp + f_size);
    temp = temp + f_size;
end

