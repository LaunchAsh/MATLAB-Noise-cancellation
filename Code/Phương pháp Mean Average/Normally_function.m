function [x_nor] = Normally_function(x)
%Ham chuan hoa tin hieu ve doan [-1,1]
%--------------------------------------------------------------------------
%x_nor : tin hieu da duoc chuan hoa
%x : tin hieu dau vao
x_nor = x/abs(max(x));
end

