function comptra(n)
    f = @(x) sqrt(x) .* log(x);
    x = 1e-40 : 1/n : 1;
    yy = f(x);
    n = length(x);
    s = (yy(1:n-1) + yy(2:n)) / 2 * 1/n;
    disp (sum(s));
end