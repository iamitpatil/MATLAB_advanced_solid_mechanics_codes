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
M_x=zeros(31,31);
M_y=zeros(31,31);
M_xy=zeros(31,31);
i=1; j=1;
for x=0:0.001:a
    for y=0:0.001:b
        resp=[0;0;0];
        diff=[0;0;0];
       for m=1:10
           for n=1:10
            alpha=m*pi/a;
            beta=n*pi/b;
            K=cal_K(c11, c12, c44, h, l, m, n);
            P=[cal_P( m, n, load,a,b); 0; 0];
            coeff=inv(K)*P;
            resp=resp+coeff.*[sin(alpha*x)*sin(beta*y); cos(alpha*x)*sin(beta*y); sin(alpha*x)*cos(beta*y)];
            diff=diff+[-alpha*coeff(2,1)*sin(alpha*x)*sin(beta*y); -beta*coeff(3,1)*sin(alpha*x)*sin(beta*y); (coeff(2,1)*beta+coeff(3,1)*alpha)*cos(alpha*x)*cos(beta*y)];
           end
       end
       M_x(j,i)=(c11*diff(1,1)+c12*diff(2,1))*(h^3)/12;
       M_y(j,i)=(c11*diff(2,1)+c12*diff(1,1))*(h^3)/12;
       M_xy(j,i)=c44*diff(3,1)*(h^3)/12;
       w(j,i)=resp(1,1);
       theta_x(j,i)=resp(2,1);
       theta_y(j,i)=resp(3,1);
       j=j+1;
    end
    j=1;
    i=i+1;
end
x=[0:0.001:a];
y=[0:0.001:b];
subplot(2,3,1);
[xx,yy]=meshgrid(x,y);
surf(xx,yy,w);
colormap jet
xlabel('x in m');
ylabel('y in m');
zlabel('w (m)');
title('w with (x,y)');
% shading interp
grid on
subplot(2,3,2);
[xx,yy]=meshgrid(x,y);
z=h/2;
surf(xx,yy,theta_x*z);
colormap jet
xlabel('x in m');
ylabel('y in m');
zlabel('u at top surface');
title('u at top surface with (x,y)');
% shading interp
grid on
subplot(2,3,3);
[xx,yy]=meshgrid(x,y);
z=h/2;
surf(xx,yy,theta_y*z);
colormap jet
xlabel('x in m');
ylabel('y in m');
zlabel('v at top surface');
title('v at top surface with (x,y)');
% shading interp
grid on
subplot(2,3,4);
[xx,yy]=meshgrid(x,y);
surf(xx,yy,M_x);
colormap jet
xlabel('x in m');
ylabel('y in m');
zlabel('M_x');
title('M_x with (x,y)');
% shading interp
grid on
subplot(2,3,5);
[xx,yy]=meshgrid(x,y);
surf(xx,yy,M_y);
colormap jet
xlabel('x in m');
ylabel('y in m');
zlabel('M_y');
title('M_y with (x,y)');
% shading interp
grid on
subplot(2,3,6);
[xx,yy]=meshgrid(x,y);
surf(xx,yy,M_xy);
colormap jet
xlabel('x in m');
ylabel('y in m');
zlabel('M_xy');
title('M_xy with (x,y)');
% shading interp
grid on
toc;