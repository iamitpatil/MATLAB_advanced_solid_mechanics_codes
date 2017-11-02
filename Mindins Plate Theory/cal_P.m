function [ P ] = cal_P( m, n,load, a, b )
%  Summary of this function goes here
%   Detailed explanation goes here
p0=500; %load
alpha=m*pi/a;
beta=n*pi/b;
switch load
    case 1 %case of uniform load
        P=(4*p0/(a*b*alpha*beta))*(((-1)^m)-1)*(((-1)^n)-1);
    otherwise
end
end




