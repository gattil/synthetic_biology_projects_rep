function dxdt = C1FFLand(t,x,t_Sx_ON,t_Sx_OFF)

% X activates Y
% Y activates Z
% X activates Z
% type of transcription function for Z: "AND gate" 

 X_inactive = 1; % We assume constitutive production of X
  
 if t >= t_Sx_ON & t< t_Sx_OFF
     X = X_inactive;
 else
     X = 0;
 end 

 Y = x(1);
 Z = x(2);
 
 % Parameters
 n = 6;
 a_z = 0;
 a_y = 0;
 k_y = 1;    
 k_z = 1;
 d_y = 1;       
 d_z = 1;       
 K_xy = 0.1;     
 K_xz = 0.1; 
 
 % Default parameter
 
  K_yz = 0.5;
 
 % Request D: K_yz = 0.1
 
 % K_yz = 0.1;
 
 % Request D: K_yz = 0.9
 
 % K_yz = 0.9;
 
 % Request 2B: K_yz = 0.01
 
 % K_yz = 0.9; 
 % K_yz = 0.01;
 
 % Request 2C: K_yz = 0.01 and a_z = 0.1
 
 % K_yz = 0.01;
 % a_z = 0.1;
 
 % Equations 
 dxdt = zeros(2,1); 
 dxdt(1) = k_y*(X/K_xy)^n/(1+(X/K_xy)^n)-d_y*Y; % 
 
 % AND (default)
 
 dxdt(2) = k_z*(X/K_xz)^n/(1+(X/K_xz)^n)*(Y/K_yz)^n/(1+(Y/K_yz)^n)-d_z*Z;
 
 % OR
 
 % dxdt(2) = k_z*((X/K_xz)^n + (Y/K_yz)^n)/((1+(X/K_xz)^n)+(Y/K_yz)^n)-d_z*Z;
 
 
 % Request 2 
 % I1FFL
 % NO: dxdt(1) = (k_y*1^n)/(1+(1)^n)-d_y*Y;
 % NO: dxdt(2) = (K_yz*1^n)/(1+Y/k_z)^n*(1^n)/(1+1^n)-d_z*Z;
 
 % dxdt(1) = a_y + k_y/2 - d_y*Y;  
 % dxdt(2) = a_z + K_yz/2*(1+(Y/k_z)^n) - d_z*Z;
 
  
 % Request 2 
 % I4FFL
 
 % dxdt(1) = -d_y*Y;
 % dxdt(2) = a_z + k_z*(X/K_xz)^n/(1+(X/K_xz)^n)-d_z*Z;
 
 
 
 
 
 