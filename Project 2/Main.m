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

A_10 = An(10);
A_20 = An(20);
A_100 = An(100);

[ Q10 R10 ] = cgs(A_10);
[ Q20 R20 ] = cgs(A_20);
[ Q100 R100 ] = cgs(A_100);

AK10 = Q10*R10;
AK20 = Q20*R20;
AK100 = Q100*R100;
% 
AK10_1 = R10*Q10 ;
AK20_1 = R20*Q20 ;
AK100_1 = R100*Q100 ;

error_10(1) = abs(eigs(AK10,1) - min(eigs(AK10))) ;
error_10(2) = abs(eigs(AK10_1,1) - min(eigs(AK10_1))) ;

for i = 1:1000
    

    
    if mod(i,2)==1 % if we have odd numbers
        [ Q10 R10 ] = cgs(AK10_1);
        [ Q20 R20 ] = cgs(AK20_1);
        [ Q100 R100 ] = cgs(AK100_1);
        
        
        AK10_1 = Q10*R10
        AK20_1 = Q20*R20;
        AK100_1 = Q100*R100;

        error_10(i+2) = abs(eigs(AK10_1,1) - min(eigs(AK10_1))) ;

        
    else % even index
        
        [ Q10 R10 ] = cgs(AK10_1);
        [ Q20 R20 ] = cgs(AK20_1);
        [ Q100 R100 ] = cgs(AK100_1);
        
        
        AK10_1 = R10*Q10;
        AK20_1 = R20*Q20;
        AK100_1 = R100*Q100;

        error_10(i+2) = abs(eigs(AK10_1,1) - min(eigs(AK10_1))) ;

        
    end
    
    
    
end

%%