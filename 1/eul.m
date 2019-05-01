function [tv,yv] = eul(a,b,n,y0)
h = (b-a)/n;

tv = zeros(1,n+1);
yv = zeros(1,n+1);

tv = a:h:b;
yv(1) = y0;

for j = 1:n
    yv(j+1) = yv(j) + h*ode1(yv(j),tv(j));
end

end
