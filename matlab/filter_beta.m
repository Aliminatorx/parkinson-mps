% Parameters
fs = 256; % Sampling frequency in Hz
low_cutoff = 13; % Low cutoff frequency in Hz
high_cutoff = 30; % High cutoff frequency in Hz

% Design the bandpass filter
[b, a] = butter(4, [low_cutoff, high_cutoff] / (fs / 2), 'bandpass');

% Number of patients and experiments per patient
num_patients = 12;
num_experiments = [2, 12, 3, 6, 3, 12, 6, 6, 12, 8, 9, 8]; % Adjust the number of experiments per patient

% Initialize structures to store filtered LFP signals
filtered_lfp2 = struct();
filtered_lfp0 = struct();

% Loop through patients and experiments
for patient = 1:num_patients
    for experiment = 1:num_experiments(patient)
        % Construct variable names dynamically for LFP2 and LFP0 data
        lfp2_var = sprintf('p%d_x%d_lfp2', patient, experiment);
        lfp0_var = sprintf('p%d_x%d_lfp0', patient, experiment);
        
        % Check if the variables exist in the workspace
        if exist(lfp2_var, 'var') && exist(lfp0_var, 'var')
            % Filter LFP2 and LFP0 signals
            filtered_lfp2.(sprintf('filt_p%d_x%d_lfp2', patient, experiment)) = filter(b, a, eval(lfp2_var));
            filtered_lfp0.(sprintf('filt_p%d_x%d_lfp0', patient, experiment)) = filter(b, a, eval(lfp0_var));
        end
    end
end
