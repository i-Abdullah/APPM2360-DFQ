%% info

clear
clc
close all




%% question 1: numerical sloution

L = 5.4; % Carraying capacity
r = 0.65; % growth rate

Lions0 = 6;

h1 = 0.5;
h2 = 0.1;
h3 = 0.01;

% span of t
tspan_1 = [ 0:h1:25 ] ;
tspan_2 = [ 0:h2:25 ] ;
tspan_3 = [ 0:h3:25 ] ;

[ th1 results_h1 ] = ode45(@(time,states) Lions(time,states,L,r), tspan_1, Lions0 );

[ th2 results_h2 ] = ode45(@(time,states) Lions(time,states,L,r), tspan_2, Lions0 );

[ th3 results_h3 ] = ode45(@(time,states) Lions(time,states,L,r), tspan_3, Lions0 );


%% question 1: analytical sloution

% exact sloution

syms x t

% exact sloution via seperation of vars
Lions_exact(x,t) = (Lions0/(L - (Lions0/L))) * exp(r*t) * ( 2 - (1/L)) ; 



% plot results 

figure(1)
plot(th1,results_h1)
hold on
plot(th2,results_h2)
hold on
plot(th3,results_h3)
xlim([0 10])
grid minor


%% question 2