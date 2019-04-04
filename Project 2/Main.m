%% this the main script to run the functions created, more info in
% Info folder.

clear
clc
close all

%% Get An


An_Matrix = An(3);
% the following is an example from a book to verfiy that the code is
% working, which is!
% An = [ 1 2 -1 ; 1 -1 2 ; 1 -1 2 ; -1 1 1 ];

% important note: due to computational accuracy, 0's aren't represented
% as 0's but rather very very small numbers (e-16 etc). so consider them
% 0

GrannShm = GS(An_Matrix);

% verfiy its' working:


% Verify set is orthogonal:

% any vector dotted with itself is == 1;
dot(GrannShm(:,1), GrannShm(:,1))
dot(GrannShm(:,2), GrannShm(:,2))
dot(GrannShm(:,3), GrannShm(:,3))

% any vector dotted with another one is == 0;
dot(GrannShm(:,1), GrannShm(:,2))
dot(GrannShm(:,1), GrannShm(:,3))
dot(GrannShm(:,2), GrannShm(:,3))


% Verify set is normal
% norm is == 1;

norm(GrannShm(:,1))
norm(GrannShm(:,2))
norm(GrannShm(:,3))

% use cgs.m to get QR Factorization:

[ Q1 R1 ] = cgs(An(3));
[ Q2 R2 ] = cgs(An(4));

% for An(3) i.e. An 3x3

A_3 = An(3);
Ak_3 = Q1*R1;
Ak1_3 = R1*Q1;

% prove they're equal
eigs(Ak_3)
eigs(Ak1_3)

% for An(4) i.e. An 4x4

A_4 = An(4);
Ak_4 = Q2*R2;
Ak1_4 = R2*Q2;

% prove they're equal
eigs(Ak_4)
eigs(Ak1_4)

%% apply it thousand times!!


%% An = 10
Matrix = {};

An10 = An(10);
Matrix{1} = An10;

for i = 1:1000
    
   
    [ Q R ] = cgs(Matrix{i});
    Matrix{i+1} = R*Q;
    
end

An10_error = abs ( pi^2 - min(diag(Matrix{end})) ) 


%% An = 20
Matrix = {};

An20 = An(20);
Matrix{1} = An20;

for i = 1:1000
    
   
    [ Q R ] = cgs(Matrix{i});
    Matrix{i+1} = R*Q;
    
end

An20_error = abs ( pi^2 - min(diag(Matrix{end})) ) 

%% An = 100
Matrix = {};

An100 = An(100);
Matrix{1} = An100;

for i = 1:1000
    
   
    [ Q R ] = cgs(Matrix{i});
    Matrix{i+1} = R*Q;
    
end

An100_error = abs ( pi^2 - min(diag(Matrix{end})) ) 

%% plot error

figure(1)
plot([ 1 2 3 ],[ An10_error An20_error An100_error ],'--r*')
title('Error in egienvalues vs matrix An size')
xlabel('Size of matrix');
ylabel('Error');
xticklabels({'An = 10','','','','', 'An = 20','','','','', 'An = 100'})
grid minor