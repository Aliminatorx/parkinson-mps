function modulation_index = compute_cfc(lfp_signal, fs, low_freq_band, high_freq_band, window_size)
    % Parameters
    low_freq_band = low_freq_band / (fs / 2); % Normalize frequency
    high_freq_band = high_freq_band / (fs / 2); % Normalize frequency
    [b_low, a_low] = butter(4, low_freq_band, 'bandpass');
    [b_high, a_high] = butter(4, high_freq_band, 'bandpass');
    
    % Filter the signal to obtain low and high frequency bands
    low_freq_signal = filter(b_low, a_low, lfp_signal);
    high_freq_signal = filter(b_high, a_high, lfp_signal);
    
    % Compute phase of low frequency band
    phase_low = angle(hilbert(low_freq_signal));
    
    % Compute amplitude of high frequency band
    amplitude_high = abs(hilbert(high_freq_signal));
    
    % Divide the signal into overlapping windows
    num_samples = length(lfp_signal);
    window_samples = floor(window_size * fs);
    num_windows = floor(num_samples / window_samples);
    
    modulation_index = zeros(num_windows, 1);
    
    for i = 1:num_windows
        start_idx = (i - 1) * window_samples + 1;
        end_idx = i * window_samples;
        
        % Extract window data
        window_phase_low = phase_low(start_idx:end_idx);
        window_amplitude_high = amplitude_high(start_idx:end_idx);
        
        % Compute mean phase-amplitude coupling
        mean_phase_amplitude = mean(window_amplitude_high .* exp(1i * window_phase_low));
        modulation_index(i) = abs(mean_phase_amplitude);
    end
    
    % Compute average modulation index across all windows
    modulation_index = mean(modulation_index);
end

% Example usage with your structs
num_patients = 12;
num_experiments = [2, 12, 3, 6, 3, 12, 6, 6, 12, 8, 9, 8]; % Adjust the number of experiments per patient
fs = 256; % Sampling frequency in Hz
low_freq_band = [4, 8]; % Low frequency band (e.g., theta)
high_freq_band = [13, 30]; % High frequency band (e.g., beta)
window_size = 10; % Size of time window in seconds

% Initialize structures to store modulation index values
cfc_lfp2 = struct();
cfc_lfp0 = struct();

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

            % Compute Cross-Frequency Coupling
            cfc_lfp2.(sprintf('cfc_p%d_x%d', patient, experiment)) = compute_cfc(lfp2_signal, fs, low_freq_band, high_freq_band, window_size);
            cfc_lfp0.(sprintf('cfc_p%d_x%d', patient, experiment)) = compute_cfc(lfp0_signal, fs, low_freq_band, high_freq_band, window_size);
        end
    end
end
