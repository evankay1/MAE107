function [tv,yv] = rk45(a,b,n,y0)
h = (b-a)/n;

yv = zeros(1,n+1);
tv = zeros(1,n+1);

tv = a:h:b;
yv(1) = y0;

for j = 1:n
    k1 = h*ode1(yv(j),tv(j));
    k2 = h*ode1(yv(j)+k1/2,tv(j)+h/2);
    k3 = h*ode1(yv(j)+k2/2,tv(j)+h/2);
    k4 = h*ode1(yv(j)+k3/2,tv(j)+h);
    yv(j+1) = yv(j) + (1/6)*(k1 + 2*(k2+k3)+k4);
end

end
