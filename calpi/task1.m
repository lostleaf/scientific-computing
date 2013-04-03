function task1(n)
    a = zeros(1,100);
    a(1) = sqrt(2);
    for i = 2:n
        a(i) = sqrt(2-sqrt(4-a(i-1)^2));
    end
    pi = 2^n * a(n);
    vpa(pi,20)
end