function task4_2( l, d, m ) 
    n = 0;
    for k = 1:m
        x = unifrnd(0, d/2);
        alpha = unifrnd(0, pi);
        if x < 0.5 * l * sin(alpha)
            n = n+1;
        end
    end
    y = 2 * l / d * m / n;
    vpa(y, 10)
end
