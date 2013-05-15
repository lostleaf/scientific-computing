f = @(x) x.^2 - x*3 + 2 - exp(x);
df = @(x) 2*x - 3 - exp(x);
x = 0.5;
disp(x);
for i = 1:1000
	y = x - f(x)/df(x);
	if abs(y-x)<1e-8;break;end;
	x = y;
	disp(x);
end
