function dxdt = toggle(t,x,k)

% reaction rates 
w = zeros(10,1);
w(1) = k(1)*x(1);  
% w(2) = ... ; to complete
% w(3) = ... ;
%     ...
% w(10);



% stoichiometric matrix (N times r)
N = [0  1  0  0  0  0  0  0  0  0;
%      ... ; to complete
%      ... ;
%      ... ;
%      ... ;
%      ... ;
%      ... ];
      
dxdt = N*w;


