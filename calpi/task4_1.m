function task4_1(k, n) %rand k points, n test average
    sum = 0; a = zeros(n);
    for i = 1:n
        a(i) = monteCalPi( k );
        sum = sum + a(i);
    end
    vpa(sum / n, 10)
end
function y = monteCalPi( k )
    m = 0;
    for n = 1:k
        if rand(1)^2 + rand(1)^2 <= 1
            m = m + 1;
        end;
    end
    y = 4 * m / k;
end
