% Parameters for Welch's method
fs = 256; % Sampling frequency (adjust if necessary)
window = 256; % Window size for PSD
noverlap = 128; % Overlap between sections
nfft = 512; % FFT length
beta_band = [13 30]; % Beta band frequency range (in Hz)

% Initialize structures to store Relative Beta Power results
relative_beta_power_lfp0 = struct();
relative_beta_power_lfp2 = struct();

% Loop through patients and experiments
num_patients = 12;
num_experiments = [2, 12, 3, 6, 3, 12, 6, 6, 12, 8, 9, 8]; % Number of experiments per patient

for patient = 1:num_patients
    for experiment = 1:num_experiments(patient)
        % Construct variable names dynamically for LFP0 and LFP2 data
        lfp0_var = sprintf('p%d_x%d_lfp0', patient, experiment);
        lfp2_var = sprintf('p%d_x%d_lfp2', patient, experiment);

        % Check if the variables exist in the workspace
        if exist(lfp0_var, 'var') && exist(lfp2_var, 'var')
            % Get the signals for LFP0 and LFP2
            signal_lfp0 = eval(lfp0_var);
            signal_lfp2 = eval(lfp2_var);
            
            % Compute PSD using pwelch
            [psd_lfp0, freq_lfp0] = pwelch(signal_lfp0, window, noverlap, nfft, fs);
            [psd_lfp2, freq_lfp2] = pwelch(signal_lfp2, window, noverlap, nfft, fs);
            
            % Find the indices for the beta band in the frequency array
            beta_indices_lfp0 = find(freq_lfp0 >= beta_band(1) & freq_lfp0 <= beta_band(2));
            beta_indices_lfp2 = find(freq_lfp2 >= beta_band(1) & freq_lfp2 <= beta_band(2));
            
            % Compute total power and beta power for LFP0
            total_power_lfp0 = sum(psd_lfp0); % Total power across all frequencies
            beta_power_lfp0 = sum(psd_lfp0(beta_indices_lfp0)); % Power in the beta band
            
            % Compute total power and beta power for LFP2
            total_power_lfp2 = sum(psd_lfp2); % Total power across all frequencies
            beta_power_lfp2 = sum(psd_lfp2(beta_indices_lfp2)); % Power in the beta band
            
            % Calculate Relative Beta Power for LFP0 and LFP2
            relative_beta_power_lfp0.(sprintf('p%d_x%d', patient, experiment)) = beta_power_lfp0 / total_power_lfp0;
            relative_beta_power_lfp2.(sprintf('p%d_x%d', patient, experiment)) = beta_power_lfp2 / total_power_lfp2;
        end
    end
end

