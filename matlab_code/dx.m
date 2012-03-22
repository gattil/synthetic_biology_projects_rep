function [ dx ] = dx( k1, n, x, y )

    dx = (k1./(1+(y.^n))) - x;

end