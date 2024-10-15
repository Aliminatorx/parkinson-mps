% Beta Band Peak Frequency Calculation

% Initialize structures to store peak frequencies
beta_peak_freq_lfp0 = struct();
beta_peak_freq_lfp2 = struct();

% Loop through patients and experiments to calculate the Beta Band Peak Frequency
for patient = 1:num_patients
    for experiment = 1:num_experiments(patient)
        % Construct variable names dynamically for filtered LFP2 and LFP0 data
        filt_lfp2_var = sprintf('filtered_lfp2.filt_p%d_x%d_lfp2', patient, experiment);
        filt_lfp0_var = sprintf('filtered_lfp0.filt_p%d_x%d_lfp0', patient, experiment);
        
        % Check if the filtered variables exist
        if isfield(filtered_lfp2, sprintf('filt_p%d_x%d_lfp2', patient, experiment)) && ...
           isfield(filtered_lfp0, sprintf('filt_p%d_x%d_lfp0', patient, experiment))
       
            % Get the filtered LFP0 data
            lfp0_data = eval(filt_lfp0_var);
            N0 = length(lfp0_data);
            freq_lfp0 = (0:N0-1) * (fs / N0); % Frequency axis
            fft_lfp0 = abs(fft(lfp0_data) / N0); % Compute FFT and normalize
            
            % Focus on the beta band (13-30 Hz)
            beta_band_lfp0 = fft_lfp0(freq_lfp0 >= low_cutoff & freq_lfp0 <= high_cutoff);
            beta_freqs_lfp0 = freq_lfp0(freq_lfp0 >= low_cutoff & freq_lfp0 <= high_cutoff);
            
            % Find the peak frequency in the beta band for LFP0
            [~, idx_lfp0] = max(beta_band_lfp0);
            beta_peak_freq_lfp0.(sprintf('p%d_x%d', patient, experiment)) = beta_freqs_lfp0(idx_lfp0);
            
            % Get the filtered LFP2 data
            lfp2_data = eval(filt_lfp2_var);
            N2 = length(lfp2_data);
            freq_lfp2 = (0:N2-1) * (fs / N2); % Frequency axis
            fft_lfp2 = abs(fft(lfp2_data) / N2); % Compute FFT and normalize
            
            % Focus on the beta band (13-30 Hz)
            beta_band_lfp2 = fft_lfp2(freq_lfp2 >= low_cutoff & freq_lfp2 <= high_cutoff);
            beta_freqs_lfp2 = freq_lfp2(freq_lfp2 >= low_cutoff & freq_lfp2 <= high_cutoff);
            
            % Find the peak frequency in the beta band for LFP2
            [~, idx_lfp2] = max(beta_band_lfp2);
            beta_peak_freq_lfp2.(sprintf('p%d_x%d', patient, experiment)) = beta_freqs_lfp2(idx_lfp2);
        end
    end
end

% The structs beta_peak_freq_lfp0 and beta_peak_freq_lfp2 now contain the
% beta band peak frequencies for all patients and experiments.









