function Y = invmod( P, C )
%mod26 inverse matrix 
%for more detail to see <<math experiments>> in page 109
    %D = det(P);
    D = P(2, 2) * P(1, 1) - P(1, 2) * P (2, 1);
    if gcd(D, 26) ~= 1;
        disp('Error');
    else
        for i = 1: 25
            if mod(i * D, 26) == 1
                break;
            end
        end
        invD = i;
        Q(1, 1) =  P(2, 2);
        Q(1, 2) = -P(1, 2);
        Q(2, 1) = -P(2, 1);
        Q(2, 2) = P(1, 1);
        Y = mod(Q * invD, 26);
    end
    Y = mod(C * Y, 26);
end

