%% info

clear
clc
close all


%% 

run('flow2.m')

hold on

    a = 1.5;
    b = 1.1;
    c = 2.5;
    d = 1.4;
    k = 0.5;
    
    tspan = [ 0 50 ] ;
    x1_0 = 0.5;
    x2_0 = 1;
    
[ t results ] = ode45(@(time,states) PP2(time,states,a,b,c,d,k), tspan, [x1_0 x2_0] );

plot(results(:,1), results(:,2),'LineWidth',4)
      xlabel('$x1$ (predator,Mountain Lions)','Interpreter','latex')
      ylabel('$x2$ (prey, Deers)','Interpreter','latex')
    title('Vector field of Lotka-Volterra system','Interpreter','latex')
%legend('Direction fields','x2 null cline','x2 null cline','x1 null cline','x1 null cline','Numerical solution','1','2')
grid minor
hold off


figure(2)

plot(t,results(:,1),'LineWidth',2)
hold on
plot(t,results(:,2),'LineWidth',2)
legend('x1','x2')
grid minor
title('Logistic Predator-Prey system numerical sloution results')
xlabel('time')
ylabel('Predator (x1) and Prey (x2) populations in dozens')