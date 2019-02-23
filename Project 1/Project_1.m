% Mt. Lion Population x
clc
r = .65;
L = 5.4;
p = 1.2;
q = 1;
% syms dx_dt(x)
% dx_dt = r*(1-(x/L))*x;
% fplot(x,dx_dt);
% syms H(x)
% H = p*x^2/(q+x^2);
% fplot(x,H);
figure(1)
syms x(t)
x = L/(1+(L/.5-1)*exp(-r*t));
fplot(t,x)



% Euler's Method
% step size .5
h_1 = .5;
T_1 = 0:.5:25;
X_1 = Eulers(T_1,h_1);
hold on
plot(T_1,X_1)

% step size .1
h_2 = .1;
T_2 = 0:.1:25;
X_2 = Eulers(T_2,h_2);
hold on
plot(T_2,X_2)

% step size .01
h_3 = .01;
T_3 = 0:.01:25;
X_3 = Eulers(T_3,h_3);
hold on
plot(T_3,X_3)
title('Population Using Euler''s Method');
ylabel('Population (Dozens of Mt. Lions)');
xlabel('Time');
legend('Actual Solution','Step Size 0.5', 'Step Size 0.1', 'Step Size 0.01'); 

%% abs error
X_s1 = zeros(1,length(T_1));
X_s2 = zeros(1,length(T_2));
X_s3 = zeros(1,length(T_3));
er1 = zeros(1,length(T_1));
er2 = zeros(1,length(T_2));
er3 = zeros(1,length(T_3));
for i = 1:length(T_1)-1
    X_s1(i) = L/(1+(L/.5-1)*exp(-r*T_1(i)));
    er1(i) = abs(X_s1(i)-X_1(i));
end

for i = 1:length(T_2)-1
    X_s2(i) = L/(1+(L/.5-1)*exp(-r*T_2(i)));
    er2(i) = abs(X_s2(i)-X_2(i));
end

for i = 1:length(T_3)-1
    X_s3(i) = L/(1+(L/.5-1)*exp(-r*T_3(i)));
    er3(i) = abs(X_s3(i)-X_3(i));
end
figure(2)
semilogy(T_1,er1);
hold on
semilogy(T_2,er2);
hold on
semilogy(T_3,er3);

title('Error in Euler''s Method');
ylabel('Error');
xlabel('Time');
legend('Step Size 0.5', 'Step Size 0.1', 'Step Size 0.01'); 


%% Direction Fields


