function Q1_simpson(h)
    ep = 0.01672;
    C1 = 4.455e15;
    p = 1.496e11;
    T1 = 100*24*3600;
    f = C1 * T1 / p^2;
    theta = 0;
    F = 0;
    fun = @(x) ( 1 - ep * cos(x))^-2;
    
    i = 2;
    while true
        theta = theta + h;
        F = F + h/6 * (fun(theta - h) + 4*fun(theta - h/2) + fun(theta));
        if F>f; break;end
        i = i+1;
    end
    
    t = theta - h;
    r = p/(1 - ep * cos(t));
    dtheta = C1 / r^2;
    v = r * dtheta;
    disp(h);disp(t);disp(v);
end
