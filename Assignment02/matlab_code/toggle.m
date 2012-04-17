function dxdt = toggle(t,x,k)

%reaction rates
w = zeros(10,1);
w(1) = k(1)*x(1);
w(2) = k(2)*x(1)*x(5);
w(3) = k(3)*x(3);
w(4) = k(4)*x(4);
w(5) = k(5)*x(4)*x(2);
w(6) = k(6)*x(6);
w(7) = k(7)*x(6)*x(2);
w(8) = k(8)*x(7);
w(9) = k(9)*x(2);
w(10) = k(10)*x(5);



% stochiometric matrix (N times M)
N = [0 -1 1 0 0 0 0 0 0 0;
    1 0 0 0 -1 1 -1 1 -1 0;
    0 1 -1 0 0 0 0 0 0 0;
    0 0 0 0 -1 1 0 0 0 0;
    0 -1 1 1 0 0 0 0 0 -1;
    0 0 0 0 1 -1 -1 1 0 0;
    0 0 0 0 0 0 1 -1 0 0];

dxdt = N*w;
