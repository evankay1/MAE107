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
syms x
% Given variables 
a = 1;
b = 4;
f = x^2;


for j = 1:6
    n = 10^(j);
    [corrected_trap_est] = cor_trap(a,b,n);
    cor_est(1,j) = corrected_trap_est;
end

for j = 1:5
    n = 10^(j);
    nv(j,:) = n;
    error(j,:) = abs(cor_est(j) - cor_est(6));
end

figure;
plot(log10(nv),log10(error))
legend('Corrected Trap Approx','location','northeast');
title('Corrected Trap Approximation');
xlabel('Time');
ylabel('Approximation');

% Input Variables: initial point (a), ending point (b), number of steps (n)
% Output Variables: corrected trapezoid estimate
function [corrected_trap_est] = cor_trap(a,b,n)
% Calculate step size
    h = (b-a)/n;
%     Initialize x vector
    x_vec = zeros(1,n+1);
    x_vec(1) = a;
%     Below calculates the x value for each step
    for i = 1:n
        x_vec(1,1+i) = a + i*h;
    end
%     Calculate the corrected trapoezoid estimate
    c = 3*fun(x_vec(1,1))-4*fun(x_vec(1,2))+fun(x_vec(1,3))+fun(x_vec(1,end-2))-...
        4*fun(x_vec(1,end-1))+3*fun(x_vec(1,end));
    corrected_trap_est = trap(a,b,n) - (h/24)*c;
%     end function
end

% Input Variables: initial point (a), ending point (b), number of steps (n)
% Output Variables: Trapezoid estimate 
function [trap_est] = trap(a,b,n)
% Calculate step size
    h = (b-a)/n;
%     Initialize the trapezoid method
    fcalc = fun(a)+fun(b);
%     Create for loop to calculate the summation in trapezoid method
    for i = 1:n-1
        y = a+h*i;
        fcalc = fcalc + 2*fun(y);
    end 
%     Calculate trapezoid estimate
    trap_est = (h/2)*fcalc;   
%     end function
end

% Input Variables: Value (x)
% Output Variables: function value with respective x
function [fun_value] = fun(x)
%   Original function
    f = x^2;
    for n = 1:5
        f = log((pi/2)*f)+(x/2);
    end
    fun_value = f;    
%     End function
end


