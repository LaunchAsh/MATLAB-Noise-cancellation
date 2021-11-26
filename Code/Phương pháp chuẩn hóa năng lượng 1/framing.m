function y = framing(x,fs,f_d)% fs = 0.01, fs = 16000, y là m?t m?ng
f_s = floor(f_d*fs);%160
fs1 = floor(f_s/2);%80
N = floor(length(x)/f_s);%chua the coi day la so khung
y = zeros(2*N-1,f_s);%ma tran kich thuoc 2*N-1 f_s
for i = 1:N
    y(i*2-1,:) = x(1,(i-1)*f_s+1:i*f_s);
end

for i = 2:N
    y(2*(i-1),:) = x(1,(i-1)*f_s+1-fs1:i*f_s-fs1);
end
end