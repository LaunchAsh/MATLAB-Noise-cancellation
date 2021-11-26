[y,fs] = audioread('lab_male.wav');      %Doc tin hieu am thanh

y = y';                                  %Doi gia tri hang va cot cua ma tran

y = normalized(y);                       %Chuan hoa tin hieu
                                         %Ham mormalized la ham tu code

f_d = 0.01;                              %Do dai cua 1 khung(giay)

frames = framing(y,fs,f_d);              %Chia tin hieu thanh cac khung chong
                                         %nhau 50%
                                         
ste = STE(frames);                       %Tinh toan nang luong ngan han cua
                                         %moi khung
                                         %Ham STE la tu code

ste = normalized(ste);                   %Chuan hoa nang luong ngan han
                                         

zcr = ZCR(frames);                       %Tinh toan toc do bang qua 0 cua 
                                         %moi khung
                                         %Ham ZCR la ham tu code
                                         
zcr = normalized(zcr);                   %Chuan hoa toc do bang qua 0
                                                                               
mark = discriminate(y,fs,f_d,ste,zcr);   %Danh dau cac khung tin hieu(tieng
                                         %noi danh dau la 1, khoang lang 
                                         %danh dau la -1)

%Ve tin hieu, nang luong ngan han, toc do bang qua 0, va cac duong phan 
%biet tieng noi va khoang lang
figure(1);
plot_signal1(y,fs,f_d,ste,zcr,mark);