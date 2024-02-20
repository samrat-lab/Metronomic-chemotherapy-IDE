function [C,E,I,D,time_span]=IDE_solver(final_para_set, amp, T, drug_free_time, init_cond, Ndose)

% final_para_set- Parameter values obtained from 'Evaluating_best_fitted_parameter_set.m' and the existing literature
% amp- Drug dose
% T- Time period between each drug dose
% drug_free_time- Time at which drug is introduced in the system
% init_cond- Initial values of the model variables
% Ndose- Number of doses to be administered

soly1=[];
soly2=[];
soly3=[];
soly4=[];
solt=[];

drugfree_sol=ode15s(@ODE_model_no_drug,[0:1:drug_free_time],init_cond);
t_drugfree = linspace(1,drug_free_time,drug_free_time);

drugfree_sol= deval(drugfree_sol,t_drugfree)';

y0=[drugfree_sol(end,1);drugfree_sol(end,2);drugfree_sol(end,3);amp];

for n=1:Ndose % No.of doses
    tl=t_drugfree(end)+(n-1)*T+1; % lower time point
    tu=t_drugfree(end)+n*T; % upper time point
    
    sol=ode15s(@IDE_model,[1,T],y0); % solving each dose cycle
    
    tint = linspace(1,T,T);
    
    y = deval(sol,tint);
    
    y0=[y(1,end);y(2,end);y(3,end);y(4,end)+amp];
    
    % concatenating all dose cycles
    soly1=[soly1 y(1,:)];% C
    soly2=[soly2 y(2,:)];% E
    soly3=[soly3 y(3,:)];% I
    soly4=[soly4 y(4,:)];% D
    
    solt=[solt [tl:tu]]; % total time points
    
    clear sol
end

time_span=[t_drugfree' ;solt'];
C=[drugfree_sol(:,1) ; soly1'];
E=[drugfree_sol(:,2) ; soly2'];
I=[drugfree_sol(:,3) ; soly3'];
D=[zeros(length(t_drugfree),1) ; soly4'];

return
