function task2_1(n)
    ret = 0; k = 1;
    for i=1:n
        ret = ret + k / (2 * i - 1) * ( 1 / 2^(2 * i - 1) ...
        + 1 / 3^(2 * i - 1));
        k = k * -1; 
    end
    vpa(ret*4,50)
end

