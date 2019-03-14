function [ derivatives ] = Lions(time,states,L,r)
% this's an ode45 function to model number of Mountain Lions
%
% States in order:
%                   - Number of lions
%
%
% Constants:
%
%                   - L: Maximum carrying capacity
%                   - r: natural growth rate


Lions_derivative = r*(1 - ( states(1) / L ) )* states(1) ;

derivatives = [ Lions_derivative ] ;


end