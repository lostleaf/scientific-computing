function compsim(n)
    f = @(x) sqrt(x) .* log(x);
    x = 1e-40 : 1/n : 1;
    n = length(x);
    s = ( f(x(1 : n-1)) + f(x(2 : n)) + 4*f( ( x(1 : n-1) + x(2 : n) ) / 2 ) ) / 6 * 1/n;
    disp (sum(s));
end