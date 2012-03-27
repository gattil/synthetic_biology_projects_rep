function [X, t] = ssa(c,t_fin,X0,v,alpha)

% function for the SSA for simulation of GRNs  written by Kevin Burrage
% (UQ) and Margherita Carletti (Urbino) - the user has to change the
% stoichiometric vectors and the propensity functions.
% There is a clever sort procedure to find the reaction number for a given
% step.
% The rate constants are in the c vector passed in from the main program

% modif 28-03-11: the state change matrix v and the molecularity matrix for the
% reactants alpha are also passed in from the main program.

%--------------------------------------------------------------------------
% c:      row vector of stochastic kinetic constants
% t_fin:  final time for the simulation
% X0:     column vector of initial conditions (number of molecules of every
%         species at t=0)
% v:      (N times M) state change matrix
% alpha:  (N times M) molecularity matrix (contains the molecularities of
%         the reactants for the M reaction channels)
%--------------------------------------------------------------------------

rand('state',0);

t_old  = 0;   
x      = X0';
t(1)   = 0;
X(:,1) = X0;

count  = 1;        

N = size(v,1);
R = size(v,2);

product = 1
while (t_old  < t_fin)    
   % t_old    
    for mu = 1:R       
        h(:,mu) = x'.^alpha(:,mu);
        a(mu) = c(mu)*prod(h(:,mu));
    end         
      a_0 = sum(a);
      if a_0==0
          disp('all populations go to extinction...program stops here')
          break
      end;
       
      tau = 1/a_0 * log(1/rand);
      standard = rand * a_0;
      A = cumsum(a);
      A = [A standard];
      B = sort(A);
      pos = find(B==standard);
      x = x+v(:,pos)';
      t_old = t_old+tau;
      t(count) = t_old;
      X(:,count) = x';
      count = count + 1;
    
end
a
t(count) = t_old;
X(:,count) = x';
size(t)
size(X)
