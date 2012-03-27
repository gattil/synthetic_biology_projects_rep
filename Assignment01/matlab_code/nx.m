
function [ y ] = nx( k1, n, x )

    y = nthroot((k1-x)./x, n);

end