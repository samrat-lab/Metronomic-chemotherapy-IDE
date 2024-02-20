function  dydt = ODE_model_no_drug(t,y)

global q1 q2 q3 k1 k2 k3 lambda1 lambda2 gamma1 gamma2 gamma3 gamma4

dydt=[(q1*y(1)*(1-(y(1)/k1)))+lambda1*y(1)*y(2)-gamma1*y(1)*y(3);
    (q2*y(2)*(1-(y(2)/k2)))+lambda2*y(1);
    ((q3*y(1)*y(3))/(1+k3*y(1)))-gamma2*y(2)*y(3)-gamma3*y(1)*y(3)-gamma4*y(3)];

return