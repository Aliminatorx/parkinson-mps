% beta_power lfp2 and lfp0

% List of patients and trials for LFP0 and LFP2 data
numPatients = 12;  % Total number of patients
numTrialsPerPatient = [2, 12, 3, 6, 3, 12, 6, 6, 12, 8, 9, 8];  % Number of trials for each patient

% Initialize structures to store the beta power for LFP0 and LFP2 for all patients
beta_power_lfp0 = struct();
beta_power_lfp2 = struct();

for p = 1:numPatients
    for t = 1:numTrialsPerPatient(p)
        % Extract field names for current patient and trial
        lfp0_field = sprintf('filt_p%d_x%d_lfp0', p, t);
        lfp2_field = sprintf('filt_p%d_x%d_lfp2', p, t);
        
        % Calculate and store beta power for LFP0 and LFP2
        beta_power_lfp0.(sprintf('bp_p%d_x%d', p, t)) = mean(eval(lfp0_field) .^ 2);
        beta_power_lfp2.(sprintf('bp_p%d_x%d', p, t)) = mean(eval(lfp2_field) .^ 2);
    end
end
