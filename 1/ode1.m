function [fun] = ode1(y,t)
    fun = 2*y + (2-abs(y)) * (2+t-cos(2*pi*(y+t)));
end
