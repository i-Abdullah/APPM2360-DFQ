%% info

clear
clc
close all




%% question 1: numerical sloution

L_Lions = 5.4; % Carraying capacity
r = 0.65; % growth rate

Lions0 = 6;

h1 = 0.5;
h2 = 0.1;
h3 = 0.01;

% span of t
tspan_1 = [ 0:h1:25 ] ;
tspan_2 = [ 0:h2:25 ] ;
tspan_3 = [ 0:h3:25 ] ;

[ th1 results_h1 ] = ode45(@(time,states) Lions(time,states,L_Lions,r), tspan_1, Lions0 );

[ th2 results_h2 ] = ode45(@(time,states) Lions(time,states,L_Lions,r), tspan_2, Lions0 );

[ th3 results_h3 ] = ode45(@(time,states) Lions(time,states,L_Lions,r), tspan_3, Lions0 );


%% question 1: analytical solution

% exact sloution

syms x t

% exact sloution via separation of vars
Lions_exact(x,t) = (Lions0/(L_Lions - (Lions0/L_Lions))) * exp(r*t) * ( 2 - (1/L_Lions)) ; 



% plot results 

figure(1)
plot(th1,results_h1)
hold on
plot(th2,results_h2)
hold on
plot(th3,results_h3)
xlim([0 10])
grid minor


% question 6
L_Deers = 8.1;
r = 0.65;
p = 1.2;
q = 1;

Deers = @(x_Deer) r*(1 - (x_Deer/L))*x_Deer - ((p*(x_Deer.^2))/(q+(x_Deer.^2))) ; 
a = [-1:.2:3];
b = [-2:.2:2];

%% question 2