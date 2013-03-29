Y0 = 1 : 9;
X0 = Y0.^2;
[Xl Yl] = lagrange(X0,Y0);
[Xc Yc] = cubic(X0,Y0,0.5,0.0556);

plot((1:0.001:9).^2,1:0.001:9,'--',Xl,Yl);
figure;
plot((1:0.001:9).^2,1:0.001:9,'--',Xc,Yc);