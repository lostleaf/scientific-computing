function romberg(n)
f = @(x) sqrt(x) .* log(x);

T=zeros(1,1);
a=1e-30; 
b=1; 
h=b-a;

T(1,1) = (f(b) - f(a)) * h /2;

for k = 2 : n
    h = h / 2;
    tmp = a : h : b;
    N = length(tmp);
    T(k, 1) = sum( f( tmp(1 : N-1) ) + f( tmp(2 : N) ) ) * h / 2;
   % disp(T(k, 1));
    for j = 2 : k
       T(k, j) = T(k, j-1) + ( T(k, j-1) - T(k-1, j-1) ) / ( 4^j - 1 );
   end
end

disp(T(n,n));
end