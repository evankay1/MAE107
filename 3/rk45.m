function [tv,Y] = rk45(a,b,n,Y0)
h = (b-a)/n;

Y = zeros(4,n+1);
tv = zeros(1,n+1);

tv = a:h:b;
Y(1,1) = Y0(1);
Y(2,1) = Y0(2);
Y(3,1) = Y0(3);
Y(4,1) = Y0(4);

for j = 1:n
    k1 = h.*eff(tv(j),Y(:,j));
    k2 = h.*eff(tv(j)+h/2,Y(:,j)+k1/2);
    k3 = h.*eff(tv(j)+h/2,Y(:,j)+k2/2);
    k4 = h.*eff(tv(j)+h,Y(:,j)+k3/2);
    Y(:,j+1) = Y(:,j) + (1/6).*(k1 + 2*(k2+k3)+k4);
end

end
