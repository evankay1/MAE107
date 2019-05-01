% Clear everything
clear all
% Close everything
close all
% Clear command window
clc
% Format Matlab to long
format long
% Format Matlab to compact
format compact

a = 0;
b = 8000;
n = 3200;
Y0 = [8000,0,0,5.5]';

[tv,Y] = rk45(a,b,n,Y0);
[xm ym] = moonpath(a,b,n);

figure;
plot(tv,Y(1,:))
hold on
plot(tv,Y(2,:))
legend('X(t)','Y(t)','location','southwest');
title('X & Y Approximations Over Time');
xlabel('Time');
ylabel('Output');

figure;
plot(Y(1,:),Y(2,:))
hold on
plot(xm,ym)
hold on
fill(5000*cos(0:.1:2*pi),5000*sin(0:.1:2*pi),'b')
legend('Spacecraft','Moon','Earth','location','northeast');
title('Spacecraft/Moon Trajectories');
xlabel('X Position');
ylabel('Y Position');
