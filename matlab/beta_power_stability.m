function beta_power_stability = compute_beta_power_stability(lfp_signal, fs, beta_band, window_size)
    % Parameters
    beta_band = beta_band / (fs / 2); % Normalize frequency
    [b, a] = butter(4, beta_band, 'bandpass');
    
    % Filter the signal to obtain beta band
    beta_signal = filter(b, a, lfp_signal);
    
    % Compute power in time windows
    num_samples = length(beta_signal);
    window_samples = floor(window_size * fs);
    num_windows = floor(num_samples / window_samples);
    
    beta_power = zeros(num_windows, 1);
    for i = 1:num_windows
        start_idx = (i - 1) * window_samples + 1;
        end_idx = i * window_samples;
        window_signal = beta_signal(start_idx:end_idx);
        
        % Compute power as the mean squared value
        beta_power(i) = mean(window_signal.^2);
    end
    
    % Compute stability as the standard deviation of power
    beta_power_stability = std(beta_power);
end

% Example usage with your structs
num_patients = 12;
num_experiments = [2, 12, 3, 6, 3, 12, 6, 6, 12, 8, 9, 8]; % Adjust the number of experiments per patient
fs = 256; % Sampling frequency in Hz
beta_band = [13, 30]; % Beta frequency band (13-30 Hz)
window_size = 10; % Size of time window in seconds

% Initialize structures to store beta power stability values
beta_power_stability_lfp2 = struct();
beta_power_stability_lfp0 = struct();

for patient = 1:num_patients
    for experiment = 1:num_experiments(patient)
        % Construct field names
        lfp2_field = sprintf('filt_p%d_x%d_lfp2', patient, experiment);
        lfp0_field = sprintf('filt_p%d_x%d_lfp0', patient, experiment);

        % Check if fields exist in the structs
        if isfield(filtered_lfp2, lfp2_field) && isfield(filtered_lfp0, lfp0_field)
            % Get filtered LFP signals
            lfp2_signal = filtered_lfp2.(lfp2_field);
            lfp0_signal = filtered_lfp0.(lfp0_field);

            % Compute beta power stability
            beta_power_stability_lfp2.(sprintf('stability_p%d_x%d', patient, experiment)) = compute_beta_power_stability(lfp2_signal, fs, beta_band, window_size);
            beta_power_stability_lfp0.(sprintf('stability_p%d_x%d', patient, experiment)) = compute_beta_power_stability(lfp0_signal, fs, beta_band, window_size);
        end
    end
end

% Save beta power stability results to CSV (Optional)
stability_lfp2_data = struct2table(beta_power_stability_lfp2);
writetable(stability_lfp2_data, 'beta_power_stability_lfp2.csv');

stability_lfp0_data = struct2table(beta_power_stability_lfp0);
writetable(stability_lfp0_data, 'beta_power_stability_lfp0.csv');
