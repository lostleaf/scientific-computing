function task3_1(n)
    x=0:1/n:1;
    y=1./(1+x.^2);
    s=2*sum(y)-1-0.5;
    2*s/n
end