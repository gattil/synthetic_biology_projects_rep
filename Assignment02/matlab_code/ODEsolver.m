% Initial conditions
x01 = [1 20 0 1 20 0 0 ];
x02 = [1 500 0 1 500 0 0];
x03 = [10 20 0 10 20 0 0];
x04 = [10 500 0 10 500 0 0];

NA = 6.02 * 10^23;
V = 10^(-14);

c1 = x01*(10^(9)/(NA*V));
n1 = (NA*V*P)/10^9;
c2 = x02*(10^(9)/(NA*V));



% Time span from 0 to 500 min in 1 min steps
tspan = [0:1:500];

k = [100 1 1 1000 1 1 100 1 6 2];

% call to ODE solver
[t,x] = ode45(@toggle, tspan, c1 , [], k)
[t,x] = ode45(@toggle, tspan, c2 , [], k)

%plotting results
plot(t,x)

%plotting only x2 (P1) and x5 (P2) vs time
plot(t,x(:,2), t, x(:,5))

