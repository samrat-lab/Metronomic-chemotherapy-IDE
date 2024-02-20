clear
close all;

load('final_para_set.mat')
runs=10000;
fold=5;
[LHSmatrix,runs]=Parameter_settings_PRCC(final_para_set,runs,fold);

for x=1:runs
    x
    final_para_set=LHSmatrix(x,:);
    amp=100;
    T=30;
    drug_free_time=30;
    init_cond=[100;10;10];
    Ndose=10;
    [C,E,I,D,time_span]=IDE_solver(final_para_set, amp, T, drug_free_time, init_cond, Ndose);
        
    C_lhs(:,x)=C;
    E_lhs(:,x)=E;
    I_lhs(:,x)=I;
    D_lhs(:,x)=D;
    
%     clear C E I D
    
end


%% CALCULATE PRCC
alpha=0.05;
PRCC_var={'q_1','q_2','q_3','k_1','k_2','k_3','\delta_1','\delta_2','\delta_3','\lambda_1','\lambda_2',...
    '\alpha','\gamma_1','\gamma_2','\gamma_3','\gamma_4'};
[prcc1,~,sign_label1]=PRCC(LHSmatrix,C_lhs,1:size(time_span,1)-1,PRCC_var,alpha);
[prcc2,~,sign_label2]=PRCC(LHSmatrix,E_lhs,1:size(time_span,1)-1,PRCC_var,alpha);
[prcc3,~,sign_label3]=PRCC(LHSmatrix,I_lhs,1:size(time_span,1)-1,PRCC_var,alpha);

prcc_C=prcc1(end,:);
p_value_C=sign_label1.uncorrected_sign(end,:);

prcc_E=prcc2(end,:);
p_value_E=sign_label2.uncorrected_sign(end,:);

prcc_I=prcc3(end,:);
p_value_I=sign_label3.uncorrected_sign(end,:);

