% [y,fs] = audioread('studio_female.wav');i= 1;%doc tin hieu dau vao
% [y,fs] = audioread('studio_male.wav');i = 2;
% [y,fs] = audioread('lab_femaleth1.wav');i = 3;
[y,fs] = audioread('lab_male.wav');i = 4;
y = y';
f_d = 0.01;%do dai cua 1 khung  
frames = framing(y,fs,f_d);%chia khung tin hieu
ch = energy_log(frames);%tinh log nang luong cac khung
ch = chuanhoa2(ch); %chuan hoa
figure(i);
val = (max(ch)+min(ch))/2;%gia tri nguong doi voi chuan hoa phan bo chuan
%val = 1.6; % gia tri nguong doi voi cach 2 theo lab_male
plot_cut(y,fs,ch,val,f_d);%tinh toan, ve chia khung



