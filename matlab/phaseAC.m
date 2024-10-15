% Define a function to compute Phase-Amplitude Coupling (PAC)
function pac = compute_pac(lfp_signal, fs, low_freq_band, high_freq_band)
    % Parameters
    low_freq_band = [low_freq_band(1), low_freq_band(2)] / (fs / 2); % Normalize frequency
    high_freq_band = [high_freq_band(1), high_freq_band(2)] / (fs / 2); % Normalize frequency
    
    % Design bandpass filters
    [b_low, a_low] = butter(4, low_freq_band, 'bandpass');
    [b_high, a_high] = butter(4, high_freq_band, 'bandpass');
    
    % Filter the signal
    low_freq_signal = filter(b_low, a_low, lfp_signal);
    high_freq_signal = filter(b_high, a_high, lfp_signal);
    
    % Compute phase and amplitude
    phase = angle(hilbert(low_freq_signal));
    amplitude = abs(hilbert(high_freq_signal));
    
    % Compute PAC (Modulation Index)
    n_bins = 18; % Number of phase bins
    phase_bins = linspace(-pi, pi, n_bins + 1);
    [phase_hist, ~] = histcounts(phase, phase_bins);
    phase_hist = phase_hist / sum(phase_hist);
    
    % Compute mean amplitude for each phase bin
    amplitude_bin_means = zeros(1, n_bins);
    for i = 1:n_bins
        bin_idx = (phase >= phase_bins(i) & phase < phase_bins(i + 1));
        amplitude_bin_means(i) = mean(amplitude(bin_idx));
    end
    
    % Normalize amplitude_bin_means
    amplitude_bin_means = amplitude_bin_means / sum(amplitude_bin_means);
    
    % Compute modulation index
    pac = sum(amplitude_bin_means .* log(amplitude_bin_means ./ phase_hist + eps));
end

% Example usage with your structs
num_patients = 12;
num_experiments = [2, 12, 3, 6, 3, 12, 6, 6, 12, 8, 9, 8]; % Adjust the number of experiments per patient
fs = 256; % Sampling frequency in Hz
low_freq_band = [4, 8]; % Low frequency band (e.g., theta)
high_freq_band = [30, 60]; % High frequency band (e.g., gamma)

% Initialize structures to store PAC values
pac_lfp2 = struct();
pac_lfp0 = struct();

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

            % Compute PAC
            pac_lfp2.(sprintf('pac_p%d_x%d', patient, experiment)) = compute_pac(lfp2_signal, fs, low_freq_band, high_freq_band);
            pac_lfp0.(sprintf('pac_p%d_x%d', patient, experiment)) = compute_pac(lfp0_signal, fs, low_freq_band, high_freq_band);
        end
    end
end
