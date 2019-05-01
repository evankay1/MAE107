function [tv,yv] = rk2(a,b,n,y0)
h = (b-a)/n;

yv = zeros(1,n+1);
tv = zeros(1,n+1);

tv = a:h:b;
yv(1) = y0;

al = 2/3;
be = 1/4;
ga = 3/4;
v = 2/3;

for j = 1:n
    f1 = ode1(yv(j),tv(j));
    yc = yv(j) + al*h*f1;
    f2 = ode1(yc,v*h+tv(j));
    yv(j+1) = yv(j) + h*((be*f1) + (ga*f2));
end
end
