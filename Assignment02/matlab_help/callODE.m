% Initial condition vector
x01 = [1 20 0 1 20 0 0 ];
x02 = [1 500 0 1 500 0 0];
x03 = [10 20 0 10 20 0 0];
x04 = [10 500 0 10 500 0 0];
   
% Time span from 0 to 500 min in 1 min steps
tspan = [0:1:500];

%    k = [k1 kc1+ kc1- k2 s d1 d2 ]
k = [100 1 1 1000 1 1 100 1 6 2];     % parameter vector
% call to ODE solver, for example:
%  ode 45 (based  on Runge Kutta 4-5)
%  ode15s (for stiff problems)
[t,x] = ode45(@toggle,tspan,x0,[],k)
% plotting results
plot(t,x)
% plotting only x2 and x4 vs time
plot(t,x(:,2), t, x(:,4))
