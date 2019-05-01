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
b = 2;
n = 2048;
h = (b-a)/n;
tv = a:h:b;
y0 = 2;
nr = 1000;

finaleulg = zeros(1,nr);

for i = 1:2
    for nr = 1:nr
        [tv,yv] = eulg(a,b,n,y0);
        finaleulg(nr) = yv(end);
    end
    figure;
    hist(finaleulg,20);
    title('1000 Brownian Estimation');
    xlabel('Y Approximation');
    ylabel('Number of times Approximation is Outputted');
end

nr = 4000;
for nr = 1:nr
        [tv,yv] = eulg(a,b,n,y0);
finaleulg(nr) = yv(end);
end
figure;
hist(finaleulg,20);
title('4000 Brownian Estimation');
xlabel('Y Approximation');
ylabel('Number of times Approximation is Outputted');