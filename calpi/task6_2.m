function task6_2( n )
    e = sym(1);
    temp = 1;
    for i = 1:n
        temp = temp * i;
        e = e + sym(1 / temp);
    end
    vpa(e, 10)
end
