%doc tin hieu dau vao
[x,Fs] = audioread('lab_male.wav');
%[x,Fs] = audioread('lab_female.wav');
%[x,Fs] = audioread('studio_male.wav');
%[x,Fs] = audioread('studio_female.wav');
N = length(x);                                       %do dai tin hieu dau vao(mau)
f_d = 0.02;                                          %do dai 1 khung(s)   
f_size = floor(f_d*Fs);                              %do dai 1 khung(mau)
frames = framing_function(x,Fs,f_d);                 %Chia khung chong
MA = Mean_Average_function(frames);                  %Tinh cuong do tin hieu trung binh
MA = Normally_function(MA);                          %chuan hoa tin hieu ve doan [-1,1]
T = Threshold_setting_function(frames,MA);           %tim gia tri bien chuan
mark = Discriminated_function(T,x,Fs,f_d,MA);        %tim vi tri khoang lang và tieng noi
Plot_Discrimination_function(x,Fs,f_d,mark,T,MA);    %Ve do thi xac dinh khoang lang và tieng noi




