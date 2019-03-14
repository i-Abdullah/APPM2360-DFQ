function [ derivatives ] = PP2(time,states,a,b,c,d,k)
% this's an ode45 function to model Preadtor prey relationship
%
% States in order:
%                   - x1 = predator
%                   - x2 = prey

%
%
% Constants:
%
%                   - a: predator mortality rate
%                   - b: predator attack rate/ conversion efficiency (food into offspring)
%                   - c: prey growth rate
%                   - d: prey mortality rate/ predator attack rate


    dx1 = (-a*states(1)) + (b*states(1)*states(2));
    dx2 =  (c.*(1-k.*states(2))) - (d*states(1)*states(2));

derivatives = [ dx1 ; dx2 ] ;


end