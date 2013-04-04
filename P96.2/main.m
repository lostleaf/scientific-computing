X = [0.0 0.1 0.2 0.3 0.5 0.8 1.0];
XX = 0:0.001:1;
Y = [1.0 0.41 0.50 0.61 0.91 2.02 2.46];

P = polyfit(X,Y,3);
plot(X,Y,'.',XX,polyval(P,XX));

figure;
P = polyfit(X,Y,4);
plot(X,Y,'.',XX,polyval(P,XX));

figure;
P = polyfit(X,Y,5);
plot(X,Y,'.',XX,polyval(P,XX));
