function [ X Y ] = cubic( X0, Y0, Diff0, Diffn )
    n = length(X0);
    H = [X0 0] - [0 X0];
    H = H(2:n);
    
    Mu = zeros(1,n); La = zeros(1,n); D = zeros(1,n);
    
    for i = 2:n-1
        La(i) =  H(i)  / (H(i) + H(i-1));
        Mu(i) = H(i-1) / (H(i) + H(i-1));
        D(i)  = 6 * ((Y0(i+1) - Y0(i)) / (X0(i+1) - X0(i)) - ...
                (Y0(i) - Y0(i-1)) / (X0(i) - X0(i-1))) / (H(i-1) + H(i));
    end
    
   D(1) = 6 * ((Y0(2) - Y0(1)) / (X0(2) - X0(1)) - Diff0) / H(1);
   D(n) = 6 * (Diffn - (Y0(n) - Y0(n-1)) / (X0(n) - X0(n-1))) / H(n-1);
    
    La(1) = 1; Mu(n) = 1;
    A = zeros(n,n); A(n,n) = 2;
    
    for i = 1:n-1
        A(i,i) = 2;
        A(i,i+1) = La(i);
        A(i+1,i) = Mu(i+1);
    end
    
    M = A \ D';
    
    X = []; Y = [];
    for i = 1 : n-1
        Xtmp = X0(i) : 0.001 : X0(i+1);
        Ytmp = M(i) * (X0(i+1) - Xtmp).^3 / (6 * H(i)) + ...
                M(i+1) * (Xtmp - X0(i)).^3 / (6 * H(i)) +  ...
                (Y0(i) - M(i) * H(i)^2 / 6) * (X0(i+1) - Xtmp) / H(i) + ...
                (Y0(i+1) - M(i+1) * H(i)^2 / 6) * (Xtmp - X0(i)) / H(i);
        X = [X Xtmp];
        Y = [Y Ytmp];
    end
   % disp(M);
end