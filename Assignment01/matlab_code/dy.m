function [ dy ] = dy( k2, x, y )

    dy = (k2./(1+x))-y;
    
end 

