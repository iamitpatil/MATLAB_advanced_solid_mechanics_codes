function [ K ] = cal_K( c11, c12, c44, h, l, m, n )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
alpha=m*pi/l;
beta=n*pi/l;

K11=c44*alpha^2+c44*beta^2;
K12=c44*alpha;
K13=c44*beta;
K21=K12;
K22=c44+(c11*((alpha*h)^2)/12)+(c44*((beta*h)^2)/12);
K23=(c12+c44)*alpha*beta*(h^2)/12;
K31=K13;
K32=K23;
K33=c44+((c44*alpha^2)+(c11*beta^2))*(h^2)/12;
K=[K11 K12 K13; K21 K22 K23; K31 K32 K33];
end

