<<<<<<< HEAD
function dxdt = toggle(x,k)

% w = vector of reaction rates 
w = zeros(10,1);
w(1) = k(1)*x(1);
w(2) = k(2)*x(1)*x(5);
w(3) = k(3)*x(3);
w(4) = k(4)*x(4);
w(5) = k(5)*x(4)*x(2);
w(6) = k(6)*x(6);
w(7) = k(7)*x(6)*x(2);
w(8) = k(8)*x(7);
w(9) = k(9)*x(2);
w(10) = k(10)*x(5);

% stoichiometric matrix (N times M)
%N = [0  1  0  0  0  0  0  0  0  0;

 
% molecularity matrix of reactants
A = [1 0 0 0 0 0 0;
 0 1 0 0 0 0 0;
 1 0 0 1 0 0 0;
 0 0 0 0 1 0 0;
 0 1 1 0 0 0 0;
 0 0 0 0 0 1 0;
 0 0 1 0 0 1 0;
 0 0 0 0 0 0 1;
 0 0 1 0 0 0 0;
 0 0 0 1 0 0 0]
 
% molecularity matrix of products
 B = [1 0 1 0 0 0 0;
 0 1 0 1 0 0 0;
 0 0 0 0 1 0 0;
 1 0 0 1 0 0 0;
 0 0 0 0 0 1 0;
 0 1 1 0 0 0 0;
 0 0 0 0 0 0 1;
 0 0 1 0 0 1 0;
 0 0 0 0 0 0 0;
 0 0 0 0 0 0 0]
 
N = B-A;
     
dxdt = N*w;

end 
=======
function dxdt = toggle(t,x,k)

% w = vector of reaction rates 
w = zeros(10,1);
w(1) = k(1)*x(1)^t(1);
w(2) = k(2)*x(2)^t(2);
w(3) = k(3)*x(3)^t(3);
w(4) = k(4)*x(4)^t(4);
w(5) = k(5)*x(5)^t(5);
w(6) = k(6)*x(6)^t(6);
w(7) = k(7)*x(7)^t(7);
w(8) = k(8)*x(8)^t(8);
w(9) = k(9)*x(9)^t(9);
w(10) = k(10)*x(10)^t(10);

end




% stoichiometric matrix (N times r)
N = [0  1  0  0  0  0  0  0  0  0;
%      ... ; to complete
%      ... ;
%      ... ;
%      ... ;
%      ... ;
%      ... ];
      
dxdt = N*w;

A = [1 0;1 0;0 1];
B= [0 1;0 1;1 0];

N = B-A;




>>>>>>> refs/heads/master
