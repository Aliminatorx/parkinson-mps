% Parameters
fs = 256; % Sampling frequency in Hz
beta_band = [13 30]; % Beta band frequency range
threshold_factor = 1.5; % Multiplier for the burst detection threshold

% Initialize structures to store mean beta burst durations
mean_beta_burst_duration_lfp2 = struct();
mean_beta_burst_duration_lfp0 = struct();

% Function to compute beta burst duration and return the mean
function mean_burst_duration = compute_mean_beta_bursts(signal, fs, beta_band, threshold_factor)
    % Step 1: Ensure the signal is a column vector
    signal = signal(:);
    
    % Step 2: Bandpass filter the signal to isolate the beta band
    [b, a] = butter(4, beta_band / (fs / 2), 'bandpass');
    beta_signal = filtfilt(b, a, signal);
    
    % Step 3: Compute the power of the filtered signal
    beta_power = beta_signal .^ 2;
    
    % Step 4: Define a threshold for detecting bursts
    threshold = mean(beta_power) + threshold_factor * std(beta_power);
    
    % Step 5: Detect bursts (where power exceeds the threshold)
    burst_mask = beta_power > threshold;
    
    % Step 6: Find the start and end points of each burst
    burst_start = find(diff([0; burst_mask]) == 1);
    burst_end = find(diff([burst_mask; 0]) == -1);
    
    % Step 7: Compute burst durations
    burst_durations = (burst_end - burst_start) / fs; % in seconds
    
    % Step 8: Return the mean burst duration
    if isempty(burst_durations)
        mean_burst_duration = 0; % No bursts detected, set duration to 0
    else
        mean_burst_duration = mean(burst_durations); % Mean of burst durations
    end
end

% Loop through patients and experiments
fields_lfp2 = fieldnames(filtered_lfp2);
for i = 1:numel(fields_lfp2)
    % Extract the filtered LFP2 signal
    signal_lfp2 = filtered_lfp2.(fields_lfp2{i});
    
    % Compute Mean Beta Burst Duration for LFP2
    mean_beta_bursts_lfp2 = compute_mean_beta_bursts(signal_lfp2, fs, beta_band, threshold_factor);
    mean_beta_burst_duration_lfp2.(fields_lfp2{i}) = mean_beta_bursts_lfp2;
    
    % Extract corresponding LFP0 field (assuming same naming convention)
    lfp0_field = strrep(fields_lfp2{i}, 'lfp2', 'lfp0');
    if isfield(filtered_lfp0, lfp0_field)
        signal_lfp0 = filtered_lfp0.(lfp0_field);
        
        % Compute Mean Beta Burst Duration for LFP0
        mean_beta_bursts_lfp0 = compute_mean_beta_bursts(signal_lfp0, fs, beta_band, threshold_factor);
        mean_beta_burst_duration_lfp0.(lfp0_field) = mean_beta_bursts_lfp0;
    end
end

% Now, the structs mean_beta_burst_duration_lfp2 and mean_beta_burst_duration_lfp0 
% contain the mean burst durations for each experiment.
