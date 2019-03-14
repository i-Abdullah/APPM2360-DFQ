%% info

clear
clc
close all


%% question 2

% assume predator on x axis, prey on y.

% predator = x1;
% prey = x2;

syms a b c d x1 x2

% nullclines:
x1_null_1 = a/b ; % x2 = a/b is null cline
x1_null_2 = 0 ; % when x1 = 0;

x2_null_1 = 0 ; % when x2 = 0 ;
x2_null_2 = c/d ; % x1 = c/d ;


% ODE 45:

run('flow.m')

hold on

    a = 1.5;
    b = 1.1;
    c = 2.5;
    d = 1.4;

    
    tspan = [ 0 20 ] ;
    x1_0 = 0.5;
    x2_0 = 1;
    
[ t results ] = ode45(@(time,states) PP(time,states,a,b,c,d), tspan, [x1_0 x2_0] );

plot(results(:,1), results(:,2))
      xlabel('$x1$ (predator,Mountain Lions)','Interpreter','latex')
      ylabel('$x2$ (prey, Deers)','Interpreter','latex')
    title('Vector field of Lotka-Volterra system','Interpreter','latex')
%legend('Direction fields','x2 null cline','x2 null cline','x1 null cline','x1 null cline','Numerical solution','1','2')
grid minor
hold off


figure(2)
plot(t,results(:,1))
hold on
plot(t,results(:,2))
title('component curve')
xlabel('t (Time)')
ylabel('Population')
legend('Predator','Prey')
grid minor

