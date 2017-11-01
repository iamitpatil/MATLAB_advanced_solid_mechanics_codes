c11=70*10^9;
c55=30*10^9;
e31=-5.1;
c11p=60*10^9;
c55p=25*10^9;
h=3*10^(-3);
hp=0.5*10^(-3);
l=30*h;
%set p in cal P
% pass b in cal_P(a,b) as your load type 1-> sinusoidal 2-> uniform 3->
% point load
v=(l/10^(-3))+1;
Load=1; 
result_final=zeros(v,9);
for V=-5:5:5
result=zeros(v,3);
for x=1:v
    resp=[0; 0; 0];
    for m=1:1
    K=cal_K( c11, c11p, c55, c55p, e31, h, hp, m, l );
    f=inv(K)*[(e31*m*pi*V/l); (-0.5*h*e31*m*pi*V/l); cal_P(m,Load)];
    resp=resp+f.*[cos(pi*m*(x-1)/(v-1)); cos(m*pi*(x-1)/(v-1)); sin(m*pi*(x-1)/(v-1))]; 
    end
    result(x,:)=resp';
end
n=(V+5)/5;
result_final(:,(3*(n)+1):(3*(n)+3))=result;
end
subplot(1,2,1);
plot([0:1:(v-1)]'/(v-1),result_final(:,3)/l,'-',[0:1:(v-1)]'/(v-1),result_final(:,6)/l, '--', [0:1:(v-1)]'/(v-1),result_final(:,9)/l,'-+' );
xlabel('x/l');
ylabel('w/l');
legend('V=-5V','V=0V','V=5V','Location', 'northeast');
grid on
subplot(1,2,2);
z=[-1.75:0.05:1.25]*10^(-3);
plot([-1.75:0.05:1.25],(-pi*c11*(result_final((v+1)/2,1)+z*result_final((v+1)/2,2))*sin(pi*0.5)/l),'-', [-1.75:0.05:1.25],(-pi*c11*(result_final((v+1)/2,4)+z*result_final((v+1)/2,5))*sin(pi*0.5)/l),'--' ,[-1.75:0.05:1.25],(-pi*c11*(result_final((v+1)/2,7)+z*result_final((v+1)/2,8))*sin(pi*0.5)/l),'-+');
xlabel('z mm');
ylabel('\sigma_x');
legend('V=-5V','V=0V','V=5V','Location', 'northeast');
grid on   
   