f = @(x) x.^2 - x*3 + 2 - exp(x);
df = @(x) 2*x - 3 - exp(x);
x = 1.5;
disp(x);
for i = 1:1000
	y = x - (x^3+2*x^2+10*x-20)/(3*x^2+4*x+10);
	if abs(y-x)<1e-8;break;end;
	x = y;
	disp(x);
end
