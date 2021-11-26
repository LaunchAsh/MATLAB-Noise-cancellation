function y = energy_log(frames)%ham nay tinh nang luong khung
[r,c] = size(frames);%lay chi so cua khung
y = zeros(1,r);%tao mang luu ket qua
frames = frames.^2;%binh phuong bien do 
for i = 1:r
    s = 0;
    for j=1:c
       s = s+frames(i,j);%tong nang luong cua mot khung
    end
    y(i) = log(s);%lay log cua khung
end

end%ket thuc ham