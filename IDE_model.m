function  dydt = IDE_model(t,y)

global q1 q2 q3 k1 k2 k3 delta1 delta2 delta3 lambda1 lambda2 alpha gamma1 gamma2 gamma3 gamma4 xi

dydt=[(q1*y(1)*(1-(y(1)/k1)))+lambda1*y(1)*y(2)-gamma1*y(1)*y(3)-(delta1*y(1)*y(4)/(alpha+y(1)));
    (q2*y(2)*(1-(y(2)/k2)))+lambda2*y(1)-delta2*y(2)*y(4);
    ((q3*y(1)*y(3))/(1+k3*y(1)))-delta3*y(3)*y(4)-gamma2*y(2)*y(3)-gamma3*y(1)*y(3)-gamma4*y(3);
    -xi*y(4)];

return

