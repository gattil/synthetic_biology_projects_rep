function prop = propensities(x,k)

%reaction rates
p = zeros(10,1);
p(1) = k(1)*x(1);
p(2) = k(2)*x(1)*x(5);
p(3) = k(3)*x(3);
p(4) = k(4)*x(4);
p(5) = k(5)*x(4)*x(2);
p(6) = k(6)*x(6);
p(7) = k(7)*x(6)*x(2);
p(8) = k(8)*x(7);
p(9) = k(9)*x(2);
p(10) = k(10)*x(5);

prop = p;

end


