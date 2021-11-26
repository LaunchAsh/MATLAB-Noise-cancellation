function y = STE(frames)
% Ham nay tra ve nang luong ngan han cho moi khung
%--------------------------------------------------------------------------
% y = STE(frames)
% y: mang cac gia tri nang luong cua moi khung
% frames: mang 2 chieu voi so hang bang so khung va so cot bang do dai mot
% khung(mau)

[r,c] = size(frames);               %Xac dinh kich thuoc cua mang cac khung

y = zeros(1,r);                     %Khoi tao y

frames = frames.^2;                 %Mang frames voi moi phan tu da duoc binh
                                    %phuong

%Tinh toan nang luong cua moi khung
for i = 1:r                             
    for j = 1:c
        y(i) = y(i)+ frames(i,j);
    end
end   
end