function lsq = Least_sq_fit(teta)

% teta- Initial guess from LHSmatrix (retrieved from 'Parameter_space_sampling.m')

global y0 data
global q1 q2 q3 k1 k2 k3 lambda1 lambda2 gamma1 gamma2 gamma3 gamma4

load('data.mat') % Load data to fit

t=data(:,1);
y_obs=data(:,2);
nobs=size(y_obs,1);
q1= teta(1);
q2= teta(2);
q3= teta(3);
k1= teta(4);
k2= teta(5);
k3= teta(6);
lambda1= teta(7);
lambda2= teta(8);
gamma1=teta(9);
gamma2=teta(10);
gamma3=teta(11);
gamma4=teta(12);

opts=odeset('reltol',1.e-5,'abstol',1.e-8);

try
    sol=ode15s(@ODE_model_no_drug,[0 max(t)],y0,opts);
    t = linspace(1,max(t),nobs);
    
    drugfree_sol= deval(sol,t)';
    
    y_cal=drugfree_sol(:,1);
    
catch
    %     if (strcmp(ME.identifier,'Warning:'))
    y_cal=zeros(nobs,1);
    %     end
end

lsq=sum((y_obs - y_cal).^2);
