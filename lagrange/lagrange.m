function [X,Y] = lagrange(X0,f)
    n = length(X0);
    
    X = -5:0.001:5;  m = length(X); Y = zeros(1,m);
    for i = 1:m
        for k = 1:n
            tmp = 1;
            for j = 1:n
                if k ~= j
                    tmp = tmp * (X(i)-X0(j)) / (X0(k)-X0(j));
                end           
            end
            %disp(tmp);
            Y(i) = Y(i) + f(X0(k))*tmp;
        end
        %disp(Y(i));
    end
end
