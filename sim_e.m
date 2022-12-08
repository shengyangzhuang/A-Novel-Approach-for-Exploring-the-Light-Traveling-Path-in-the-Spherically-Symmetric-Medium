% clear
% clc
X = VarName1;
Y = VarName2;
x_dot=[0 -0.5];
y_dot=[0 0];
figure(1)
aplha=0:pi/40:2*pi;
r=2;
x=r*cos(aplha);
y=r*sin(aplha);
p1=plot(x,y,'-','LineWidth',2);
axis equal;
hold on;
p2=plot(X(:,1),Y(:,1),'LineWidth',2)
f = ezplot('sqrt(x*x+y*y)-(5/7)*x-6/7', [-2 2.414]);
set(f,'Color','g','LineWidth',2,'LineStyle','--')
p3=plot(x_dot,y_dot,'k.','MarkerSize',15)
grid on;
xlabel('x[m]','Fontsize',15)
ylabel('y[m]','Fontsize',15)
legend([p1 p2 f],{'Mdium model','Simulation trajectory','Theoretical trajectory'})
title('')
figure(2)
for i=1:1670
    a(i,1)= sqrt((-24/49)*X(i,1)*X(i,1)+(60/49)*X(i,1)+36/49);
    e(i,1)=a(i,1)-Y(i,1);
end
plot(X(:,1),e(:,1),'b-','LineWidth',2)
vx=[1.6,1.6];
vy=[-1,1.5];
line(vx,vy,'LineWidth',1.5,'LineStyle','--')
grid on
xlabel('x[m]','Fontsize',15)
ylabel('y[m]','Fontsize',15)
legend('error','Fontsize',15)
title('Error between simulation trajectory and theoretical trajectory')
%title('Comparison between theoretical and simulation trajectory','Fontsize',15)