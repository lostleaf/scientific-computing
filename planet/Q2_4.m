function Q2_4
    function dy=build(t,y)
        C1=2.7132e+015;MG=1.3271e+020;
        dy=[C1^2/y(2)^3-MG/y(2)^2;y(1);C1/y(2)^2];
    end
[t,y]=ode45(@build,[0 50*24*3600],[0,0.6982e11,0]);
disp(y(length(y),2));disp(y(length(y),3));
end