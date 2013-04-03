function task3_2(n)
    x = 0:1/n:1; m = length(x); s = 0;
    for i = 1:m-1
        s = s + (x(i+1)-x(i)) / 6  * (1 / ( 1 + x(i)^2) ...
            + 4 / (1 +(x(i) + x(i+1))^2 / 4) + 1 / ( 1 + x(i+1)^2) );
    end
    vpa(s*4,15)
end
