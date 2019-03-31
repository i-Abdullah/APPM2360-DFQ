function [ Matrix ] = An(n)
% this code will try to create the An matrix to estimate the eigenvalues
% for more information read section 3 in the folder info.
%
% - - - - - - - - - - - - - - - - - -
%
% Inputs: n (size of nxn matrix)
%
% - - - - - - - - - - - - - - - - - -
%
% Ouputs : Matrix nxn that has the pattren shown in section 3 in the
% folder.
%

% Bn is the matrix that has the pattrens -1 2 -1, see section 3.

Bn = zeros(n,n);

for i = 1:n
    
    if i == 1;
    Bn(i,i) = 2;
    Bn(i,i+1) = -1;

    elseif i == n
        
    Bn(i,i-1) = -1;
    Bn(i,i) = 2;

        
    else
        
    Bn(i,i-1) = -1;
    Bn(i,i) = 2;
    Bn(i,i+1) = -1;

    end

end


Matrix = (( n+1 / 1 ) ^2) * Bn ; 

end