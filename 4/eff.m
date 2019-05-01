function [num] = eff(t,Y)

mew = 200000;
mewm = 20000;
rm = 15500;
theta = (pi/6);
w = sqrt(mew/(rm)^(3));

xmm = @(t) rm*cos(theta + w*t);
xm = xmm(t);
ymm = @(t) rm*sin(theta + w*t);
ym = ymm(t);

xdot = Y(3);
ydot = Y(4);
x = Y(1);
y = Y(2);

uudot = @(x,y) (-mew*x)/(x^2+y^2)^(3/2) + (-mewm*(x-xm))/((x-xm)^2+(y-ym)^2)^(3/2);
vvdot = @(x,y) (-mew*y)/(x^2+y^2)^(3/2) + (-mewm*(y-ym))/((x-xm)^2+(y-ym)^2)^(3/2);

udot = uudot(x,y);
vdot = vvdot(x,y);

num = [xdot ydot udot vdot]';
end




