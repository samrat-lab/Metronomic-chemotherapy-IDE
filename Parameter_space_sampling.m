function [LHSmatrix,runs] = Parameter_space_sampling(baseline_parset,runs,fold)

% baseline_parset- Parameter values obtained from the literature
% runs- Number of parameter sets to be generated
% fold- Fold shift from baseline value to create sampling space

q1_LHS=LHS_Call(q1/fold, q1, q1*fold, 0 ,runs,'unif');
q2_LHS=LHS_Call(q2/fold, q2, q2*fold, 0 ,runs,'unif');
q3_LHS=LHS_Call(q3/fold, q3, q3*fold, 0 ,runs,'unif');
k1_LHS=LHS_Call(k1/fold, k1, k1*fold, 0 ,runs,'unif');
k2_LHS=LHS_Call(k2/fold, k2, k2*fold, 0 ,runs,'unif');
k3_LHS=LHS_Call(k3/fold, k3, k3*fold, 0 ,runs,'unif');
lambda1_LHS=LHS_Call(lambda1/fold, lambda1, lambda1*fold, 0 ,runs,'unif');
lambda2_LHS=LHS_Call(lambda2/fold, lambda2, lambda2*fold, 0 ,runs,'unif');
gamma1_LHS=LHS_Call(gamma1/fold, gamma1, gamma1*fold, 0 ,runs,'unif');
gamma2_LHS=LHS_Call(gamma2/fold, gamma2, gamma2*fold, 0 ,runs,'unif');
gamma3_LHS=LHS_Call(gamma3/fold, gamma3, gamma3*fold, 0 ,runs,'unif');
gamma4_LHS=LHS_Call(gamma4/fold, gamma4, gamma4*fold, 0 ,runs,'unif');


%% LHS MATRIX
LHSmatrix=[q1_LHS q2_LHS q3_LHS k1_LHS k2_LHS k3_LHS lambda1_LHS lambda2_LHS gamma1_LHS gamma2_LHS ...
    gamma3_LHS gamma4_LHS];

return