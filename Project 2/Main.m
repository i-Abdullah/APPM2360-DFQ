%% this the main script to run the functions created, more info in
% Info folder.

clear
clc
close all

%% Get An


An = An(3);
% the following is an example from a book to verfiy that the code is
% working, which is!
% An = [ 1 2 -1 ; 1 -1 2 ; 1 -1 2 ; -1 1 1 ];

% important note: due to computational accuracy, 0's aren't represented
% as 0's but rather very very small numbers (e-16 etc). so consider them
% 0

GrannShm = GS(An);

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