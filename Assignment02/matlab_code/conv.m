function vconc  = conv( x )
%CONV Summary of this function goes here
%   Detailed explanation goes here

NA = 6.02 * 10^23;
V = 10^(-14);

vconc = x*(10^(9)/(NA*V));

end

