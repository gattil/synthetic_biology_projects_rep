
%#############################################################
%##                   Synth Bio Project 02                  ##
%#############################################################
%# Author: Stephanie Fingerhuth, Lorenzo Gatti
%# Date: 02-Apr-2012		v.0.0.1
%# Update: 28-Mar-2012      v.0.1.1
%# Usage: 
%# Parametres: 	
%# Output: 
%# 
%# TODO: Add comments [DONE]
%#
%##############################################################

%#########################################
% Problem [1]
%#########################################
% 
% Initial condition vector

i{1} = [1 20 0 1 20 0 0 ];
i{2} = [1 500 0 1 500 0 0];
i{3} = [10 20 0 10 20 0 0];
i{4} = [10 500 0 10 500 0 0];
   
% Time span from 0 to 500 min in 1 min steps
tspan = [0:1:500];


% Parameter vector
% k = [k1 kc1+ kc1- k2 kc2+ kc2- kc3+ kc3- d1 d2 ]
k = [100 1 1 1000 1 1 100 1 6 2];     


% Call to ODE solver, for example:
% Ode 45 (based  on Runge Kutta 4-5)

% Fron first state of reactions
[t,x] = ode45(@toggle, tspan, conv(i{1}), [], k);

% Plotting results
plot(t,x)
print('-depsc2', 'plot_1A');


% Fron second state of reactions
[t,x] = ode45(@toggle, tspan, conv(i{2}), [], k);

% Plotting results
plot(t,x)
print('-depsc2', 'plot_1B');



%#########################################
% Problem [2]
%#########################################
% 
% Sets of values for stochastic rate constants (k) starting from
% deterministic constants from TABLE 1

% set_SRC = [ k1 kc1+ kc1- k2 kc2+ kc2- kc3+ kc3- d1 d2 ]
set_SRC = [100 0.1661 1 1000 0.1661 1 16.6113 1 6 2];

%calculate propensities 
prop(:,1) = propensities(i{1}, set_SRC);
prop(:,2) = propensities(i{2}, set_SRC);
prop(:,3) = propensities(i{3}, set_SRC);
prop(:,4) = propensities(i{4}, set_SRC);

            
% state-change-vectors corrisponds to columns in stoichiometric matrix N

% stochiometric matrix (N times M)
N = [0 -1 1 0 0 0 0 0 0 0;
    1 0 0 0 -1 1 -1 1 -1 0;
    0 1 -1 0 0 0 0 0 0 0;
    0 0 0 0 -1 1 0 0 0 0;
    0 -1 1 1 0 0 0 0 0 -1;
    0 0 0 0 1 -1 -1 1 0 0;
    0 0 0 0 0 0 1 -1 0 0];
% % stochiometric matrix (N times M)
% N =
%    [0 -1 1 0 0 0 0 0 0 0;
%     1 0 0 0 -1 1 -1 1 -1 0;
%     0 1 -1 0 0 0 0 0 0 0;
%     0 0 0 0 -1 1 0 0 0 0;
%     0 -1 1 1 0 0 0 0 0 -1;
%     0 0 0 0 1 -1 -1 1 0 0;
%     0 0 0 0 0 0 1 -1 0 0];



% Performing task D

% molecularity matrix of the reactands
A = [1 0 1 0 0 0 0 0 0 0;
    0 0 0 0 1 0 1 0 1 0;
    0 0 0 1 0 0 0 0 0 0;
    0 1 0 0 1 0 0 0 0 0;
    0 0 1 0 0 0 0 0 0 1;
    0 0 0 0 0 1 1 0 0 0;
    0 0 0 0 0 0 0 1 0 0];

[X, t] = ssa(set_SRC,500,i{1}',N,A);

              
%plot histogram of P1
t_t = 0;
P1s = X(2, :);
hh = histc(P1s, min(P1s):max(P1s));
bar(min(P1s):max(P1s), hh/sum(hh));
print('-depsc2', 'plot_3A');

% ---------------------------------
% Performing task 3
% ---------------------------------
%
% Deterministic simulations
%


% Condition 03
%
[t3,x3] = ode45(@toggle, tspan, conv(i{3}), [], k);

% Plotting results
plot(t3,x3)
print('-depsc2', 'plot_3_D_C3');

% Condition 04
%
[t4,x4] = ode45(@toggle, tspan, conv(i{4}), [], k);

% Plotting results
plot(t4,x4)
print('-depsc2', 'plot_3_D_C4');



%
% Stochastic simulations
%

% Condition 03
%

[XS3, TS3] = ssa(set_SRC,500,i{3}',N,A);

% Plot histogram of P1 in C03
t_t = 0;
P1s = XS3(2, :);
hh = histc(P1s, min(P1s):max(P1s));
bar(min(P1s):max(P1s), hh/sum(hh));
print('-depsc2', 'plot_3_S_C03');

% Condition 04 (doesn't work!)
%

[XS4, TS4] = ssa(set_SRC,500,i{4}',N,A);

% Plot histogram of P1 in C03
t_t = 0;
P1s = XS4(2, :);
hh = histc(P1s, min(P1s):max(P1s));
bar(min(P1s):max(P1s), hh/sum(hh));
print('-depsc2', 'plot_3_S_C04');