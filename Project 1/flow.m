close all; clear all; 
% This Matlab code generates a vector field for the system of ODEs 
% dx1/dt = f(x1,x2), dx2/dt = g(x1,x2)

% This code currently will find the vector field for the EXAMPLE problem
%           dx1/dt = a*x2
%           dx2/dt = -x1
%--------------------------------------------------------------------------
%        THESE ARE NOT THE PROBLEMS YOU ARE SOLVING FOR PROJECT 1!
% (To have this code generate the vector fields for the Project 1 systems 
% of equations, make any necessary adjustments in the sections of code 
% labeled with "Step i" where i = 1, 2, 3, 4, or 5)
%--------------------------------------------------------------------------


% Step 1: Set the axis limits so that you plot the vector field over the
%         intervals x1min < x1 < x1max, x2min < x2 < x2max
    x1min = -1; x1max = 6; x2min = -1; x2max = 6;

% Step 2: pick step sizes for x1 and x2;
    x1step = 0.5; x2step = 0.5; 

% generate mesh for plotting
    [x1, x2] = meshgrid(x1min:x1step:x1max, x2min:x2step:x2max);

% Step 3: define all needed parameter values 
    a = 1.5;
    b = 1.1;
    c = 2.5;
    d = 1.4;

% Step 4: define the system of equations you are using
    dx1 = (-a.*x1) + (b.*x1.*x2);
    dx2 =  (c.*x2) - (d.*x1.*x2);

% normalize vectors (to help plotting)
    dx1 = dx1./sqrt(dx1.^2 + dx2.^2); 
    dx2 = dx2./sqrt(dx1.^2 + dx2.^2); 

% generate the vector field

%% nullclines:
x1_null_1 = a/b ; % x2 = a/b is null cline
x1_null_2 = 0 ; % when x1 = 0;

x2_null_1 = 0 ; % when x2 = 0 ;
x2_null_2 = c/d ; % x1 = c/d ;

% put null clines in vectors to plot:

[ r c ] = size(x1);

x1_null_1 = ones(r,1)*x1_null_1;
x1_null_2 = ones(r,1)*x1_null_2;
x2_null_1 = ones(r,1)*x2_null_1;
x2_null_2 = ones(r,1)*x2_null_2;

%% plot


figure(1)

    quiver(x1, x2, dx1,dx2,'AutoScaleFactor',0.4)
    hold on
    plot([x2_null_1 x2_null_1],[-1 10],'--k','LineWidth',1)
    hold on
    plot([x2_null_2 x2_null_2],[-1 10],'--k','LineWidth',1)
    hold on
    plot([-1 10],[x1_null_1 x1_null_1],'--r','LineWidth',1)
    hold on
    plot([-1 10],[x1_null_2 x1_null_2],'--r','LineWidth',1)
    grid minor
    


% specify the plotting axes
    axis([x1min x1max x2min x2max])

% Step 5: label the axes, include a title    
      xlabel('$x1$','Interpreter','latex')
      ylabel('$x2$','Interpreter','latex')
%     title('Vector field of Lotka-Volterra system','Interpreter','latex')
    %legend('Direction fields','x2 null cline','x2 null cline','x1 null cline','x1 null cline')


hold on


