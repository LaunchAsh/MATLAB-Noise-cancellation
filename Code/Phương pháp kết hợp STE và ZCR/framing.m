function y = framing(x,fs,f_d)
% Ham nay dung de chia tin hieu thanh cac khung chong nhau
%--------------------------------------------------------------------------
% y = framing(x,fs,f_d)
% y: mang hai chieu voi so hang bang so khung va so cot bang do dai cua
% khung
% x: tin hieu can chia khung 
% fs: tan so lay mau cua tin hieu
% f_d: do dai cua 1 khung

f_s = floor(f_d*fs);                         %Do dai cua khung(mau)

fs1 = floor(f_s/2);                          %Do dai cua mot nua khung(mau)

N = floor(length(x)/f_s);                    %So khung co the chia duoc

y = zeros(2*N-1,f_s);                        %Khoi tao y

%Chia khung chong cho tin hieu
for i = 1:N                                     
    y(i*2-1,:) = x(1,(i-1)*f_s+1:i*f_s);
end
for i = 2:N
    y(2*(i-1),:) = x(1,(i-1)*f_s+1-fs1:i*f_s-fs1);
end
end