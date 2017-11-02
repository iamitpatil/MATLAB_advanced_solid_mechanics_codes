% Mindins Plate Theory
tic;
E=200*10^9;
nu=0.3;
c11=E/(1-nu^2);
c12=E*nu/(1-nu^2);
c44=(c11-c12)/2;
h=3*10^(-3);
l=h*10;
b=l;
a=b;
load=1;
w=zeros(31,31);
theta_x=zeros(31,31);
theta_y=zeros(31,31);
i=1; j=1;
for x=0:0.001:a
    for y=0:0.001:b
        resp=[0;0;0];
       for m=1:10
           for n=1:10
            alpha=m*pi/a;
            beta=n*pi/b;
            K=cal_K(c11, c12, c44, h, l, m, n);
            P=[cal_P( m, n, load,a,b); 0; 0];
            coeff=inv(K)*P;
            resp=resp+coeff.*[sin(alpha*x)*sin(beta*y); cos(alpha*x)*sin(beta*y); sin(alpha*x)*cos(beta*y)];
           end
       end
       w(j,i)=resp(1,1);
       theta_x(j,i)=resp(2,1);
       theta_y(j,i)=resp(3,1);
       j=j+1;
    end
    j=1;
    i=i+1;
end
subplot(1,3,1);
[xx,yy]=meshgrid([0:0.001:a],[0:0.001:b]);
surf(xx,yy,w);
xlabel('x in m');
ylabel('y in m');
zlabel('w (m)');
% shading interp
grid on
subplot(1,3,2);
[xx,yy]=meshgrid([0:0.001:a],[0:0.001:b]);
z=h/2;
surf(xx,yy,theta_x*z);
xlabel('x in m');
ylabel('y in m');
zlabel('u at top surface');
% shading interp
grid on
subplot(1,3,3);
[xx,yy]=meshgrid([0:0.001:a],[0:0.001:b]);
z=h/2;
surf(xx,yy,theta_y*z);
xlabel('x in m');
ylabel('y in m');
zlabel('v at top surface');
% shading interp
grid on
toc;