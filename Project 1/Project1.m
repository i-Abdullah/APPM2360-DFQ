
%% info

clear
clc
close all




%% question 1: using ODE45

%{

[ th1 results_h1 ] = ode45(@(time,states) Lions(time,states,L_Lions,r), tspan_1, Lions0 );

[ th2 results_h2 ] = ode45(@(time,states) Lions(time,states,L_Lions,r), tspan_2, Lions0 );

[ th3 results_h3 ] = ode45(@(time,states) Lions(time,states,L_Lions,r), tspan_3, Lions0 );
%}

%% use euler's

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


L_Lions = 5.4; % Carraying capacity
r = 0.65; % growth rate

Lions0 = 6;


% pre-size matrices:

eulers_h1 = zeros(1,length(tspan_1));
eulers_h2 = zeros(1,length(tspan_2));
eulers_h3 = zeros(1,length(tspan_3));

% define matrices
eulers_h1(1) = Lions0;
eulers_h2(1) = Lions0;
eulers_h3(1) = Lions0;

% derivative
Lions_derivative = @(x) r*(1 - ( x / L_Lions ) )* x ;

% euler h = 0.5;
for i = 1:length(tspan_1)
    
    eulers_h1(i+1) = eulers_h1(i) + h1*Lions_derivative(eulers_h1(i));
    
end

% euler h = 0.1
for i = 1:length(tspan_2)
    
    eulers_h2(i+1) = eulers_h2(i) + h2*Lions_derivative(eulers_h2(i));
    
end

% euler h = 0.01
for i = 1:length(tspan_3)
    
    eulers_h3(i+1) = eulers_h3(i) + h3*Lions_derivative(eulers_h3(i));
    
end


% question 1: analytical solution

% exact sloution


% exact sloution via separation of vars
Lions_exact = @(t) L_Lions ./ ( 1 + (( (L_Lions/Lions0) -1 )* exp((-r*t)))) ;


figure(1)

plot(tspan_1,eulers_h1(1:end-1),'.-','LineWidth',1);
hold on
plot(tspan_2,eulers_h2(1:end-1),'.-','LineWidth',1);
hold on
plot(tspan_3,eulers_h3(1:end-1),'.-','LineWidth',1);
hold on
plot(tspan_2,Lions_exact(tspan_2),'LineWidth',1.5)
xlim([0 10])
legend('h = 0.5','h = 0.1','h = 0.01','Exact sloution')
grid minor
title('analytical solutions with various step sizes and the exact solution')
xlabel('Time')
ylabel('Population of Mountain Lions')
x = 0;

%% plot errors for question 3:

% estimate abslout error

AbsError_h1 = abs ( Lions_exact(tspan_1) - eulers_h1(1:end-1) ) ;
AbsError_h2 = abs ( Lions_exact(tspan_2) - eulers_h2(1:end-1) ) ;
AbsError_h3 = abs ( Lions_exact(tspan_3) - eulers_h3(1:end-1) ) ;


figure (2)
semilogy(tspan_1,AbsError_h1);
hold on
semilogy(tspan_2,AbsError_h2);
hold on
semilogy(tspan_3,AbsError_h3);

xlim([-2 10]);

%% explore the beahvior of H(x)

p = 1.2;
q = 1;

H = @(x) (p*(x.^2))/(q + (x.^2)) ; % harvesting function
x_span = [0:1000]; % range for x.

plot(x_span,H(x_span))

%%

% question 6
L_Deers = 8.1;
r = 0.65;
p = 1.2;
q = 1;

Deers = @(x_Deer) r*(1 - (x_Deer/L))*x_Deer - ((p*(x_Deer.^2))/(q+(x_Deer.^2))) ; 
a = [-1:.2:3];
b = [-2:.2:2];

%% question 2: