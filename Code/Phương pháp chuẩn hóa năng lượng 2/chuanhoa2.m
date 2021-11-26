function y = chuanhoa2(x)

le = length(x); % do dai tin hieu
y = zeros(1,le); %  khoi tao gia tri cho y
dolechchuan = sqrt(var(x)); % 
for i=1:le
    y(i) = (x(i)-mean(x))/dolechchuan;
end
end