% Syn Bio Project 4



clear all
clc




% ##############
% task 1


% system equations
syms x y a KM kDx kDy vx vy;
dxdt = vx * (a + (x^2 / (KM + x^2 + y^2))) - kDx * x;
dydt = vy * x - kDy * y;

% solving dydt for y, 'symbolic y steady state' syss
syss = solve(dydt, y);

% substituting y in dxdt
sdxdt = subs(dxdt, y, syss); 

% solving dxdt for x
sxss = solve(sdxdt, x);

% only 1st solution biologically meaningful
sxss = sxss(1)




% ##############
% task 2

% parameters
KM = 10/9;
kDx = 1/10;
kDy = 1/20;
vx = 1;
vy = 3/20;

a1 = 0;
a2 = 1/100;
% from here on variables are marked with var1 for a1, var2 for a2


% substitute syms for parameter values
xss = subs(sxss);
yss = subs(syss);

% equation with a substituted
xss1 = subs(xss, a, a1)
xss2 = subs(xss, a, a2)


% substituting x in syss
yss1 = subs(yss, x, xss1)
yss2 = subs(yss, x, xss2)




% ##############
% task 3

% Jacobian
J(1,1) = diff(dxdt, x);
J(2,1) = diff(dxdt, y);
J(1,2) = diff(dydt, x);
J(2,1) = diff(dydt, y);
J



% ##############
% task 4

% substituting parameters
J = subs(J);

% plugging in steady states
J1 = subs(J, [x, y], [xss1, yss1]);
J2 = subs(J, [x, y], [xss2, yss2]);

% determinant
det1 = det(J1)
det2 = det(J2)

% trace
trace1 = trace(J1)
trace2 = trace(J2)



% ##############
% task 5

% if trace^2 < 4det variable osc is true
if trace1^2 < 4 * det1
    osc1 = 1;
else
    osc1 = 0;
end


if trace2^2 < 4 * det2
    osc2 = 1;
else
    osc2 = 0;
end

osc1
osc2




% ##############
% task 6
% so far completely wrong. I think what I should do is define a system
% matrix to give it to an ode solver. I'm working on that.

system = [sdxdt;
          dydt];
      
system1 = subs(system, a, a1);
system1 = subs(system1);
system2 = subs(system, a, a2);
system2 = subs(system2);
      
tspan = [0:0.1:100];

ini = [1 1];
      
[t1, z1] = ode45 (system1, tspan, ini);
[t2, z2] = ode45 (system2, tspan, ini);
