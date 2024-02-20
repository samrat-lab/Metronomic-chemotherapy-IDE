function [LHSmatrix,runs] = Parameter_settings_PRCC(final_para_set,runs,fold)

% final_para_set- Parameter values obtained from 'Evaluating_best_fitted_parameter_set.m' and the existing literature
% runs- Number of parameter sets to be generated
% fold- Fold shift from final_para_set to create sampling space

q1_LHS=LHS_Call(q1/fold, q1, q1*fold, 0 ,runs,'unif');
q2_LHS=LHS_Call(q2/fold, q2, q2*fold, 0 ,runs,'unif');
q3_LHS=LHS_Call(q3/fold, q3, q3*fold, 0 ,runs,'unif');
k1_LHS=LHS_Call(k1/fold, k1, k1*fold, 0 ,runs,'unif');
k2_LHS=LHS_Call(k2/fold, k2, k2*fold, 0 ,runs,'unif');
k3_LHS=LHS_Call(k3/fold, k3, k3*fold, 0 ,runs,'unif');
delta1_LHS=LHS_Call(delta1/fold, delta1, delta1*fold, 0 ,runs,'unif');
delta2_LHS=LHS_Call(delta2/fold, delta2, delta2*fold, 0 ,runs,'unif');
delta3_LHS=LHS_Call(delta3/fold, delta3, delta3*fold, 0 ,runs,'unif');
lambda1_LHS=LHS_Call(lambda1/fold, lambda1, lambda1*fold, 0 ,runs,'unif');
lambda2_LHS=LHS_Call(lambda2/fold, lambda2, lambda2*fold, 0 ,runs,'unif');
alpha_LHS=LHS_Call(alpha/fold, alpha, alpha*fold, 0 ,runs,'unif');
gamma1_LHS=LHS_Call(gamma1/fold, gamma1, gamma1*fold, 0 ,runs,'unif');
gamma2_LHS=LHS_Call(gamma2/fold, gamma2, gamma2*fold, 0 ,runs,'unif');
gamma3_LHS=LHS_Call(gamma3/fold, gamma3, gamma3*fold, 0 ,runs,'unif');
gamma4_LHS=LHS_Call(gamma4/fold, gamma4, gamma4*fold, 0 ,runs,'unif');


%% LHS MATRIX
LHSmatrix=[q1_LHS q2_LHS q3_LHS k1_LHS k2_LHS k3_LHS delta1_LHS delta2_LHS delta3_LHS lambda1_LHS lambda2_LHS ...
    alpha_LHS gamma1_LHS gamma2_LHS gamma3_LHS gamma4_LHS];

return