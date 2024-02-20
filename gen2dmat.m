function [mat,optdict]=gen2dmat(amprange,interv_range,xi,final_para_set)
% Input
% amprange- max drug dose to be explored
% intervrange- max value of interval to be explored
% xi- drug clearance rate
% final_para_set- Parameter values obtained from 'Evaluating_best_fitted_parameter_set.m' and literature

% Output
% mat- 2D mat for C_end values for varying drug dose and interval at xi (clearance rate)
% optdict- contains all the permissable drug dose and dose interval for tumor clearance with min dose

C_end=[];
i=0;
for amp=1:1:amprange % varying drug dose
    i=i+1;
    j=0;
    for per=2:1:interv_range % varying dose interval
        j=j+1;
        
        soly1=[];
        soly2=[];
        soly3=[];
        soly4=[];
        solt=[];
        T=per; % Time period between each drug dose
        cdn1=max([(q1*alpha*xi)/delta1; (q2*xi)/delta2]); % cdn1 < cdn2
        
        cdn2=amp/T;
        condtion(i,j)=cdn2 >= cdn1;
        drug_free_time=30;
        
        drugfree_sol=ode15s(@ODE_model_no_drug,[0,drug_free_time],init_cond);
        t_drugfree = linspace(1,drug_free_time);
        
        drugfree_sol= deval(drugfree_sol,t_drugfree)';
        y0=[drugfree_sol(end,1);drugfree_sol(end,2);drugfree_sol(end,3);amp];
        ttot=drug_free_time;
        nopt=1;
        while ttot<totalcutofftime
            ttot=ttot+per;
            
            nopt=nopt+1;
        end
        nopt=nopt-1;
        for n=1:nopt
            tl=drug_free_time+(n*T)+1; % lower time point
            tu=drug_free_time+(n+1)*T; % upper time point
            
            sol=ode15s(@IDE_model,[1:1:T],y0);
            
            tint = linspace(1,T,T);
            
            y = deval(sol,tint);
            
            y0=[y(1,end);y(2,end);y(3,end);amp];
            
            % concatenating all dose cycles
            soly1=[soly1 y(1,:)];% C
            soly2=[soly2 y(2,:)];% E
            soly3=[soly3 y(3,:)];% I
            soly4=[soly4 y(4,:)];% D
            
            solt=[solt [tl:tu]]; % total time points
            
        end
        
        soltf=[t_drugfree' ; solt'];
        soly1f=[drugfree_sol(:,1) ; soly1'];
        soly2f=[drugfree_sol(:,2) ; soly2'];
        soly3f=[drugfree_sol(:,3) ; soly3'];
        soly4f=[zeros(length(t_drugfree),1) ; soly4'];
        C_end(i,j)=soly1f(end);
        I_end(i,j)=soly3f(end);
        E_end(i,j)=soly2f(end);
    end
    
    i
end
mat=C_end;
amprange=1:1:amprange;
interv_range=1:1:interv_range;

ampmaxmat=zeros(size(C_end,1),size(C_end,2));
optdict=[];
for i=1:1:size(C_end,1)
    
    find(C_end1(i,:)==min(C_end));
    if isempty(ans)
        minampidx(i)=0;
    else
        minampidx(i)=ans(end);
        ampmaxmat(i,ans(end))=1;
        optdict(i,1)=i;
        optdict(i,2)=ans(end);
    end
    
end

return