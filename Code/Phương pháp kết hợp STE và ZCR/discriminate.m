function mark = discriminate(y,fs,f_d,ste,zcr)
% Ham nay dung de danh dau cac khung tin hieu
%--------------------------------------------------------------------------
% mark = discriminate(y,fs,f_d,ste,zcr)
% mark: mang danh dau cac khung(neu tieng noi danh dau la 1, khoang lang 
% danh dau -1)
% y: tin hieu vao
% fs: tan so lay mau cua tin hieu
% f_d: do dai cua 1 khung(giay)
% ste: nang luong ngan han cua cac khung
% zcr: toc do bang qua 0 cua cac khung

f_s = floor(f_d*fs);                     %Do dai cua mot khung tin hieu(mau)

N1 = floor(length(y)/f_s);               %So khung chia duoc

mark = zeros(1,2*N1-1);                  %Khoi tao mang danh dau

%Danh dau 
for i = 1:2*N1-1                         
    if (ste(i)>=0.008 && zcr(i)<=0.71)
        mark(i) = 1;
    else
        mark(i) = -1;
    end
end

%Neu do dai cua khoang lang nho hon 200ms thi bo qua
i = 1;
while i <= (2*N1-1)
    if(mark(i)==(-1))
        dem = 0;
        j = i;
        while mark(i) == (-1)
            dem = dem+1;
            i = i+1;
            if i >(2*N1-1) 
                break;
            end
        end
        if dem <= 40
            for k = j:(j+dem-1)
                mark(k) = 1;
            end
        end
    else 
        i = i + 1;
    end
end
end