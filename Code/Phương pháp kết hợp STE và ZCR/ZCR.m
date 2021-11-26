function y = ZCR(frames)
% Ham nay tra ve toc do bang qua 0 cho moi khung
%--------------------------------------------------------------------------
% y = ZCR(frames)
% y: mang cac gia tri toc do bang qua 0 cua moi khung
% frames: mang 2 chieu voi so hang bang so khung va so cot bang do dai mot
% khung(mau)

[r,c] = size(frames);              %Xac dinh kich thuong cua mang cac khung

sgn = zeros(r,c);                  %Ham sgn[n] cua x[n] (bang 1 neu x[n]>=0, 
                                   %bang -1 neu nguoc lai)

y = zeros(1,r);                    %Khoi tao y

%Tinh toan sgn[n]
for i = 1:r                        
    for j = 1:c
       if frames(i,j)>=0
           sgn(i,j) = 1;
       else
           sgn(i,j) = -1;
       end
    end
end

%Tinh toan toc do bang qua 0 cua moi khung
for i = 1:r                        
    for j = 1:c-1
        y(i) = y(i) + abs(sgn(i,j)-sgn(i,j+1));
    end
    y(i) = y(i)/(2*c);
end
end