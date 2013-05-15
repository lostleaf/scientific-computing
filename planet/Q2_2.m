
function Q2_2(h)
    function dy=build(t,y)
        C1=2.7132e+015;MG=1.3271e+020;
        dy=[C1^2/y(2)^3-MG/y(2)^2;y(1);C1/y(2)^2];
    end
[t,y]=ode45(@build,0:h:100*24*3600,[0,0.6982e11,0]);
n=find(y(:,3)<2*pi,1,'last');
T=t(n);
r=y(round(n/2),2);
disp(T/24/3600);disp(r);
polar(y(:,3),y(:,2));
end