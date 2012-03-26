%#############################################################
%##                   Synth Bio Project 01                  ##
%#############################################################
%# Author: Stephanie Fingerhuth, Lorenzo Gatti
%# Date: 09-Mar-2012		v.0.0.1
%# Update: 10-Mar-2012      v.0.1.1
%# Usage: 
%# Parametres: 	
%# Output: 
%# 
%# TODO: Add comments [DONE]
%#
%##############################################################

%#########################################
% Problem [B]
%#########################################
% Solving equation with given parametres: 
% n=3, k1p = 8; k2p = {2,4,6}

% Initialization of variables
n = 3;
k1 = 8;
k2 = [2 4 6];
x_val = [0:0.01:10];

% Defining the range of X and Y

[vf_x, vf_y] = meshgrid(0:0.45:15,0:0.20:10);

% Plotting solutions on a graph
for i=1:length(k2)

    % Plotting the vector field
    quiver(vf_x, vf_y,dx(k1, n, vf_x, vf_y), dy(k2(i), vf_x, vf_y), 2);
    
    hold on;
    
    % Find intersection points for the defined functions (X,Y)
    [xi, yi] = polyxpoly(x_val, nx(k1, n, x_val), x_val, ny(x_val, k2(i)));
    
    % Plotting the nulclines
    plot(x_val, nx(k1, n, x_val), x_val, ny(x_val, k2(i)));
    
    % Plot intersection of graphs
    plot(xi, yi, 'or', 'MarkerSize',10);
    
    xlabel('[X]');
    ylabel('[Y]');
    
    % Setting the new axis 
    axis([0 max(x_val) 0 10]);

    hold off;
    
    % Export graph in a pdf file
    print('-dpdf', ['plot_B' num2str(i)]);
end

%#########################################
% Problem [C]
%#########################################

% Defining the equations to solve

e1 = 'x = k1/(1+y^3)';
e2 = 'y = k2/(1+x)';
e3 = 'diff(k1/(1+y^3), y)*diff(k2/(1+x),x) =1';

% Solving system of equations

S = solve(e1, e2, e3, 'y', 'k1', 'k2');

% Retriving first solution for each variable

k1 = S.k1(1);
k2 = S.k2(1);
y = S.y(1);

% Defining the range of X

x = [0:0.01:5];

% Solve the equations in the range of x

k1_solv = x.*subs(k1);
k2_solv = x.*subs(k2);

%#########################################
% Problem [D]
%#########################################

% Plotting of the solutions from the previous step

plot(k1_solv, k2_solv);
xlabel('[k1]');
ylabel('[k2]');

% Setting the new axis 

axis([0 max(k1_solv) 0 max(k2_solv)]);

% Export graph in a pdf file
print('-dpdf', 'plot_D0');

