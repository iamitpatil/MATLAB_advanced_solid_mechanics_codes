function [ K ] = cal_K( c11, c11p, c55, c55p, e31, h, hp, m, l )
alpha=m*pi/l;
K11=(c11*h+c11p*hp)*alpha^2;
K12=0.5*(h*hp*(c11p-c11)*alpha^2);
K13=0;
K21=K12;
K22=((h*((h^2)/12+(hp^2)/4)*c11 + hp*((h^2)/4+(hp^2)/12)*c11p)*alpha^2 + c55*h+c55p*hp);
K23=(alpha*(c55*h+c55p*hp));
K31=0;
K32=(alpha*(c55*h+c55p*hp));
K33=K32*alpha;
K=[K11 K12 K13; K21 K22 K23; K31 K32 K33];
end

