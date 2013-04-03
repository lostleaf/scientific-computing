function task2_2(n)
    ret = 0; k = 1;
    for i=1:n
        ret = ret + k / (2 * i - 1) * ( 4 / 5^(2 * i - 1) ...
        - 1 / 239^(2 * i - 1));
        k = k * -1; 
    end
    vpa(ret*4,50)
end