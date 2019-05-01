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
b = 4;
y0 = 2;

figure;
finaleul = zeros(1,8);
for g = 3:10
    n = 2^g;
    [tv,yv] = eul(a,b,n,y0);
    finaleul(g-2) = yv(end);
    plot(tv,yv)
    hold on
end
legend('n^3','n^4','n^5','n^6','n^7','n^8','n^9','n^10','location','northeast');
title('Eulers Method Approximations');
xlabel('Time');
ylabel('Y Approximation');
hold off

figure;
finalrk2 = zeros(1,8);
for g = 3:10
    n = 2^g;
    [tv,yv] = rk2(a,b,n,y0);
    finalrk2(g-2) = yv(end);
    plot(tv,yv)
    hold on
end
legend('n^3','n^4','n^5','n^6','n^7','n^8','n^9','n^10','location','northeast');
title('RK2 Method Approximations');
xlabel('Time');
ylabel('Y Approximation');
hold off

figure;
finalrk45 = zeros(1,8);
for g = 3:10
    n = 2^g;
    [tv,yv] = rk45(a,b,n,y0);
    finalrk45(g-2) = yv(end);
    plot(tv,yv)
    hold on
end
legend('n^3','n^4','n^5','n^6','n^7','n^8','n^9','n^10','location','northeast');
title('RK45 Method Approximations');
xlabel('Time');
ylabel('Y Approximation');
hold off

erroreul = zeros(1,8);
errorrk2 = zeros(1,8);
errorrk45 = zeros(1,8);
nv = zeros(1,8);
for g = 3:10
    n = 2^g;
    nv(g-2) = n;
    erroreul(g-2) = abs(finaleul(g-2) - yv(end));
    errorrk2(g-2) = abs(finalrk2(g-2) - yv(end));
    errorrk45(g-2) = abs(finalrk45(g-2) - yv(end));
end
figure;
plot(log10(nv),log10(erroreul));
hold on
plot(log10(nv),log10(errorrk2));
hold on
plot(log10(nv),log10(errorrk45));
hold off
legend('Euler','RK2','RK45','location','northeast');
title('Log of Error Approximations');
xlabel('Log10 of Number of Steps');
ylabel('Log10 of Error');

funeul = zeros(1,8);
funrk2 = zeros(1,8);
funrk45 = zeros(1,8); 
for g = 3:10
    n = 2^g;
    funeul(g-2) = 1*n;
    funrk2(g-2) = 2*n;
    funrk45(g-2) = 4*n;
end
figure;
plot(log10(funeul),log10(erroreul));s
hold on
plot(log10(funrk2),log10(errorrk2));
hold on
plot(log10(funrk45),log10(errorrk45));
hold off
legend('Euler','RK2','RK45','location','northeast');
title('Error vs. Function Evaluations');
xlabel('Log10 of Number of Function Evaluations');
ylabel('Log10 of Error');

figure;
plot(log10(funeul),log10(erroreul));
hold on
plot(log10(funrk2),log10(errorrk2));
hold on
plot(log10(funrk45),log10(errorrk45));
hold off
legend('Euler','RK2','RK45','location','northeast');
title('Function Evaluation Estimation Graph');
xlabel('Log10 of Number of Function Evaluations');
ylabel('Log10 of Error');
xlim([0 5]);