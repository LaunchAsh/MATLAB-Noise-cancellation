function y = normalized(x)
%Ham nay dung de chuan hoa tin hieu
%--------------------------------------------------------------------------
%[y] = normalized(x)
%y: tin hieu sau khi chuan hoa
%x: tin hieu can chuan hoa

y = x./max((abs(x)));                     %Chuan hoa tin hieu

end