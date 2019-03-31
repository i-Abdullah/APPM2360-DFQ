function [GS_matrix ] = GS(An)
% this function takes a linearly independent set of vectors
% and outputs an orthanormal set, using the study Gram-Schmidt
% process. In this function, inputs will be arranged in a matrix
% and the function will use the columns of the matrix to create
% an orthanormal set, and output them in matrix
%
% For more info, go into info file.
%
%
%

[ r c ] = size(An);


for i = 1:c
    
    % get summation term in GS.
    if i>1
        
    for j = 1:i
        
        if j == 1 
        ortha(:,1) = An(:,i);
        
        else
            
       ortha(:,1) = ortha(:,1) - ( dot(GS_matrix(:,j-1), An(:,i))*GS_matrix(:,j-1)) ; ;

            
        end
        
    end
    
     GS_matrix(:,i) = ortha(:,1) / norm(ortha(:,1)) ;

    
    elseif i==1
        % this's the orthagonal vector, then we normalize. 
        ortha(:,i) = An(:,i) ;
        %nromalize (so orthanormal).
        GS_matrix(:,i) = ortha(:,i) / norm(ortha(:,i)) ;
        
    end
        
end


end