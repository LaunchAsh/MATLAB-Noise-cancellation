function y = chuanhoa1(x)%ham nay de chuan hoa dau vao ve dai [0,1]
mi = min(x);%tim gia tri min 
an = max(x)-min(x);%tinh hieu cua max va min
y = (x-mi)/(an); %tien hanh chuan hoa
end
%ket thuc ham
