function plot_signal(y,fs,f_d,ste,zcr,mark)
% Ham nay dung de ve tin hieu, nang luong ngan han, toc do bang qua 0, va
% cac duong phan biet tieng noi va khoang lang
%--------------------------------------------------------------------------
% plot_signal(y,fs,f_d,ste,zcr,mark)
% y: tin hieu vao
% fs: tan so lay mau cua tin hieu
% f_d: do dai cua 1 khung(giay)
% ste: nang luong ngan han cua cac khung
% zcr: toc do bang qua 0 cua cac khung
% mark: mang danh dau cac khung(neu tieng noi danh dau la 1, khoang lang 
% danh dau -1)

N = length(y);                           %Do dai cua tin hieu(mau)
t = 1/fs:1/fs:N/fs;                      %Vector thoi gian roi rac
f_s = floor(f_d*fs);                     %Do dai cua mot khung(mau)
f_s1 = floor(f_s/2);                     %Do dai cua mot nua khung
N1 = floor(length(y)/f_s);               %So luong khung chia duoc(la 2*N1+1)

ste1 = zeros(1,N);                       %Mang nay dung de ve nang luong 
                                         %ngan han
                                         
%Tinh toan ste1
for i = 1:N1-1
    ste1((i-1)*f_s+1:i*f_s) = ste((2*(i-1))+1);
end
ste1((N1-1)*f_s:end) = ste(2*N1-1);


zcr1 = zeros(1,N);                       %Mang nay dung de ve toc do bang 
                                         %qua 0;
                                         
%Tinh toan zrc1
for i = 1:N1-1
    zcr1((i-1)*f_s+1:i*f_s) = zcr((2*(i-1))+1);
end
zcr1((N1-1)*f_s:end) = zcr(2*N1-1);

mark1 = [];                              %Mang danh dau cac vi tri giao nhau
                                         %giua tieng noi va khoang lang
                                         
%Tinh toan mark1
for i = 1:2*N1-2
    if mark(i)*mark(i+1)<0
        mark1 = [mark1,i];
    end
end

%Ve tin hieu
plot(t,y,'b','Linewidth',0.5);
axis([min(t),max(t),min(y),max(ste)]);
hold on;

%Ve nang luong ngan han va toc do bang qua 0
plot(t,ste1,'Color','r','Linewidth',1);
plot(t,zcr1,'Color',[0.4660 0.6740 0.1880],'Linewidth',1);

%Ve duong phan cach giua tieng noi va khoang lang
for i = 1:length(mark1)
    if mod(mark1(i),2) == 1
        tam = (((mark1(i)+1)/2)*f_s+1)/fs;
    else
        tam = ((mark1(i)/2)*f_s + f_s1 + 1)/fs;
    end

    if mark(mark1(i)) == -1
        plot([tam,tam],[-1,1],'--','Color',[0.4940 0.1840 0.5560],'Linewidth',1.5);
    else
        plot([tam,tam],[-1,1],'--','Color','k','Linewidth',1.5);
    end
end

%Dieu chinh cac tham so 
xlabel('Time(s)');
ylabel('Magnitude');
title('Speech/Silence Discrimination')
legend('Signal','STE','ZCR','Start','End');
end