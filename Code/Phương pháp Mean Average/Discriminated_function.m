function mark3 = Discriminated_function(T,x,Fs,f_d,MA)
%Ham tim tieng noi và khoang lang
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%mark3 = Discrimination_function(T,x,Fs,f_d,MA)
%mark3 : mang danh dau khung nao là tieng noi/khoang lang
%T : gia tri bien chuan
%x : tín hieu dau vào
%Fs : tan so cua tín hieu
%f_d : do dai 1 khung(mau)
%MA : cuong do tin hieu trung binh 
f_s = floor(f_d*Fs);            %Chieu rong cua 1 khung
N1 = floor(length(x)/f_s);      %So luong khung duoc chia theo chieu dai tin hieu
mark = zeros(1,2*N1-1);         %mang danh dau khung tieng noi/khoang lang
%%
%danh dau khung nào là tieng noi/khoang lang
for i = 1:2*N1-1
    if MA(i)>T
        mark(i) = 1;
    else
        mark(i) = -1;
    end
end
%%
i = 1;
%Neu khoang lang nho hon 200ms thì danh dau la giong noi
while i <= (2*N1-1)
    if(mark(i)==(-1))
        Silence_size = 0;
        j = i;
        while mark(i) == (-1)
            Silence_size = Silence_size+1;
            i = i+1;
            if i >(2*N1-1) 
                break;
            end
        end
        if Silence_size <= 10
            for k = j:(j+Silence_size-1)
                mark(k) = 1;
            end
        end
    else 
        i = i + 1;
    end
end
%%
%Luu vi tri cac diem chuyen tu khoang lang qua giong noi va nguoc lai
mark1 = [];
for i = 1:2*N1-2
    if mark(i)*mark(i+1)<0
        mark1 = [mark1,i];
    end
end
%%
%So lan chuyen tu khoang lang qua giong noi va nguoc lai
N2 = length(mark1);                   
%Luu do dai cac doan giong noi
mark2 = zeros(1,N2);
mark2(1) = mark1(1)*mark(mark1(1));
for i = 2:N2
    mark2(i) = (mark1(i) - mark1(i-1))*mark(mark1(i));
end
%Neu do dai giong noi ngan hon 60ms thi dat lai thanh khoang lang 
for i = 2:N2
    if mark2(i)>0&&mark2(i)<=3
        for k = mark1(i-1) + 1 : mark1(i)
            mark(k) = -1;
        end
    end
end
mark3 = mark;
end