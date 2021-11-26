function T = Threshold_setting_function(frames, MA)
%Ham tinh toan bien chuan giua tieng noi va khoang lang
%--------------------------------------------------------------------------
%T = Threshold_setting_function(frames, MA)
%T : Bien chuan cua tin hieu
%frames : khung chong da chia
%MA : cuong do tin hieu trung binh
N = floor(length(MA)/2);
%%
f = zeros(1,N);
g = zeros(1,N);
for i = 1:N
    f(i) = MA(2*(i-1)+1);
end
for i = 1:N-1
    g(i) = MA(2*i);
end
%%
Tmin = min(f);                        %Bien thap nhat cua MA
Tmax = max(g);                        %Bien cao nhat cua MA
%%
T = (1/2)*(Tmin + Tmax);              %Bien chuan ban dau
%%
i = 0;
p = 0;
mark = g > T;                         %Luu cac diem MA lon hon bien chuan
g1 = frames(mark,:);                  %Dung lai cac khung co bien cao hon bien chuan
mark = f < T;                         %Luu các diem MA nho hon biên chuan
f1 = frames(mark,:);                  %Dung lai cac khung co bien nho hon bien chuan
%So luong khung lon hon bien chuan
for k = 1:N
    if f(k) < T
        i = i + 1;
    end
end            
%So luong khung nho hon bien chuan
for h = 1:N
    if g(h) > T
        p = p + 1;
    end
end                         
%%
j = -1;                                 %Khoi tao j
q = -1;                                 %Khoi tao q
%%
left1 = 0;
left2 = 0;
%Lap den khi i va p la bat bien
%cung he thuc (1/i)*sum(f-T,0) - (1/p)*sum(T-g,0) = 0
while  i ~= j || p ~= q
    for k = 1:i
        if f1(k)-T > 0 
            left1 = left1 + max(f1(k)-T);
        end
    end
    left1 = (1/i)*left1;
    for h = 1:p
        if T - g1(k) > 0 
            left2 = left2 + max(T-g1(h));
        end
    end
    left2 = (1/p)*left2;
    if left1 - left2 > 0
        Tmin = T; 
    else 
        Tmax = T;
    end
    T = (1/2)*(Tmin + Tmax);            %dinh lai gia tri bien chuan hien tai
    j = i;
    q = p;
    mark = g > T;
    g1 = frames(mark,:);
    mark = f < T;
    f1 = frames(mark,:);
    i = 0;
    p = 0;
    %So luong khung lon hon bien chuan hien tai
    for k = 1:N
        if f(k) < T
            i = i + 1;
        end
    end     
    %So luong khung nho hon bien chuan hien tai
    for h = 1:N
        if g(h) > T
            p = p + 1;
        end
    end                         
end
end
