clear all
clc

% time range for the experiment
t0 = -1;
tend = 20;

% switching times for the signal Sx
t_Sx_ON  =  0;
t_Sx_OFF =  6;

% stimulus
t_sti= [t0,t_Sx_ON,t_Sx_OFF,tend];
Sx_sti = [0, 1, 0, 0];

% tspan for simulation
tspan = [t0:0.01:tend];

% initial conditions for simulation
x0=[0,0];

% integrator options
opt = odeset;
opt = odeset('AbsTol',1e-13, 'RelTol',1e-10)

% integration
[t,x] = ode45(@C1FFLand, tspan, x0, opt, t_Sx_ON, t_Sx_OFF);

% plot results
subplot(3,1,1)
fig1 = stairs(t_sti, Sx_sti, 'r','linewidth',2)
axis([t0 tend -0.2 1.2])
set(fig1)
grid on
title('stimulus')
xlabel('t')
ylabel('Sx')

subplot(3,1,2)
plot(t,x(:,1),'linewidth',2)
axis([t0 tend -0.2 1.2])
grid on
title('Y response')
xlabel('t')
ylabel('Y')

subplot(3,1,3)
plot(t,x(:,2),'g','linewidth',2)
axis([t0 tend -0.2 1.2])
grid on
title('Z response')
xlabel('t')
ylabel('Z')

