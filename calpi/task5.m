function task5(n)
    prod = 1;
    for i=1:n
        prod = prod * ( 4 * i^2) / ( 4 * i^2 - 1 );
    end
    vpa(2 * prod,20)
end