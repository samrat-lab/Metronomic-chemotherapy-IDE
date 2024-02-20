global y0
% global q1 q2 q3 k1 k2 k3 lambda1 lambda2 gamma1 gamma2 gamma3 gamma4

load('baseline_parset.mat') % Load baseline parameter set
runs=10000;
fold=10;
[LHSmatrix,runs] = Parameter_space_sampling(baseline_parset,runs,fold);
% teta_opt=[];
% lsq=[];
for i=1:runs
    teta= LHSmatrix(i,:);
    y0=[10;10;10];
    options = optimset('Display','iter','TolFun',1e-2,'TolX',1e-2);
    [teta_opt(i),lsq(i)]=fminsearch(@Least_sq_fit,teta,options);
end

[a,b]=sort(lsq,'ascend');
fit_para_set=teta_opt(b(1));

% save fit_para_set fit_para_set

