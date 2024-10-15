% List of patients and trials for LFP0, LFP2, and MPC data
patients = 1:12; % Patients
trials = 1:12; % Trials

% Initialize structures
lfp2_data = struct();
lfp0_data = struct();
mpc_data = struct();

% Loop through each patient and trial to fill the structures
for patient = patients
    for trial = trials
        % Construct variable names dynamically for each type of data
        lfp2_var = sprintf('p%d_x%d_lfp2', patient, trial);
        lfp0_var = sprintf('p%d_x%d_lfp0', patient, trial);
        mpc_var = sprintf('p%d_x%d_mpc', patient, trial);

        % Check if the variables exist and assign to structures
        if exist(lfp2_var, 'var')
            lfp2_data.(sprintf('p%d_x%d_lfp2', patient, trial)) = eval(lfp2_var);
        end
        
        if exist(lfp0_var, 'var')
            lfp0_data.(sprintf('p%d_x%d_lfp0', patient, trial)) = eval(lfp0_var);
        end
        
        if exist(mpc_var, 'var')
            mpc_data.(sprintf('p%d_x%d_mpc', patient, trial)) = eval(mpc_var);
        end
    end
end
