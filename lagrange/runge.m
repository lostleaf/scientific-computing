f = @(x) 1 ./ (1 + x.^2);
[X,Y] = lagrange(-5:1:5,f);
plot(X,Y,'--',X,f(X));


figure;
[X,Y] = lagrange(-5:0.5:5,f);
plot(X,Y,'--',X,f(X));
