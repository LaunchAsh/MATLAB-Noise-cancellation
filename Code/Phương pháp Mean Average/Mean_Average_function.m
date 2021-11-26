function [MA] = Mean_Average_function(frames)
%Ham tinh cuong do tin hieu trung binh
%--------------------------------------------------------------------------
%[MA] = Mean_Average_function(frames)
%MA : cuong do tin hieu trung binh
%frames : cac khung chong da duoc chia
frames = abs(frames);   %lay gia tri tuyet doi voi moi phan tu cua moi khung
[r,c] = size(frames);   %lay kich thuoc cua mang luu cac khung
%Tinh toan cuong do tin hieu trung binh cho tung frames
MA = zeros(1,r);       
for i = 1:r
    for j = 1:c
        MA(i) = MA(i) + frames(i,j);
    end
end
MA = log(MA);           %lay log cua cuong do tin hieu trung binh
