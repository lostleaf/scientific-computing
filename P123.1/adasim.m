function I = adasim(a, b, eps)
    f = @(x) sqrt(x) .* log(x);
    sim = @(a, b) (f(a) + 4 * f( (a + b)/2 ) + f(b)) / 6 * (b - a);
    mid = (a + b) / 2;
    I1 = sim(a, b);
    I2 = sim(a, mid);
    I3 = sim(mid, b);
    if I1 - I2 - I3 < eps / 15 
        I = I1;
    else
        I = adasim(a, mid, eps/2) + adasim(mid, b,  eps/2);
    end
end