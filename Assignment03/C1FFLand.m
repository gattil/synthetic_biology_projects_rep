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
 k_y = 1;    
 k_z = 1;
 d_y = 1;       
 d_z = 1;       
 K_xy = 0.1;     
 K_xz = 0.1; 
 K_yz = 0.5;
 
 % Equations 
 dxdt = zeros(2,1); 
 dxdt(1) = k_y*(X/K_xy)^n/(1+(X/K_xy)^n)-d_y*Y; % 
 dxdt(2) = k_z*(X/K_xz)^n/(1+(X/K_xz)^n)*(Y/K_yz)^n/(1+(Y/K_yz)^n)-d_z*Z;
 