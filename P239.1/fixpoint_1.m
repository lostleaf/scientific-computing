f = @(x) log(x.^2-x*3+2);

x = 0.5;
for i = 1:1000
	y = x-(f(x)-x)^2/(f(f(x))-2*f(x)+x);
	if abs(y-x)<1e-8;break;end;
	x=y;
	disp(x);
end
% disp(x);
