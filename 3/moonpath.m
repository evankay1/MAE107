function [xm ym] = moonpath(a,b,n)

h = (b-a)/n;
tv = a:h:b;
mew = 200000;
mewm = 20000;
rm = 18000;
theta = (pi/6);
w = sqrt(mew/(rm)^(3));

xmm = @(t) rm*cos(theta + w*t);
ymm = @(t) rm*sin(theta + w*t);

xm = zeros(1,n+1);
ym =  zeros(1,n+1);

for j = 1:n+1
    xm(j) = xmm(tv(j));
    ym(j) = ymm(tv(j));
end

end