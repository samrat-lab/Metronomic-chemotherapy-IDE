# **A mathematical model to study low-dose metronomic scheduling for chemotherapy**

**ODE_model_no_drug.m**- Contains model without the effect of the drug

**IDE_model.m**- Contains model with the effect of the drug

**Evaluating_best_fitted_parameter_set.m**- Finds the parameter set with minimum Euclidean distance with the input data to fit

**Least_sq_fit.m, fminsearch.m, Parameter_space_sampling.m**- Additional files required to evaluate the best-fitted parameter set

**IDE_solver.m**- Solves the model with an impulse effect of the drug

**gen2dmat.m**- Code for evaluating the relationship between varying drug doses, dose intervals, and drug clearance rate

**Global_sensitivity_analysis.m**- Code for evaluating the sensitivity indices of the model parameters

**Parameter_settings_PRCC.m, PRCC.m, LHS_Call.m**- Additional files required for global sensitivity analysis


