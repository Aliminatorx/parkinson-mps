% Parameters
fs = 256; % Sampling frequency in Hz
beta_band = [13 30]; % Beta band frequency range

% Initialize structures to store coherence results
coherence_lfp0_lfp2 = struct();

% Function to compute coherence between two signals
function beta_coherence = compute_beta_coherence(lfp0_signal, lfp2_signal, fs, beta_band)
    % Make sure both signals are the same length
    min_length = min(length(lfp0_signal), length(lfp2_signal));
    lfp0_signal = lfp0_signal(1:min_length);
    lfp2_signal = lfp2_signal(1:min_length);
    
    % Compute magnitude squared coherence
    [coh, f] = mscohere(lfp0_signal, lfp2_signal, [], [], [], fs);
    
    % Extract coherence in the beta band
    beta_idx = (f >= beta_band(1)) & (f <= beta_band(2));
    beta_coherence = mean(coh(beta_idx)); % Mean coherence in beta band
end

% Loop through patients and experiments
fields_lfp2 = fieldnames(filtered_lfp2);
for i = 1:numel(fields_lfp2)
    % Extract the filtered LFP2 and LFP0 signals
    signal_lfp2 = filtered_lfp2.(fields_lfp2{i});
    
    % Extract corresponding LFP0 field (assuming same naming convention)
    lfp0_field = strrep(fields_lfp2{i}, 'lfp2', 'lfp0');
    if isfield(filtered_lfp0, lfp0_field)
        signal_lfp0 = filtered_lfp0.(lfp0_field);
        
        % Compute Beta Band Coherence
        beta_coherence_val = compute_beta_coherence(signal_lfp0, signal_lfp2, fs, beta_band);
        
        % Store result in the struct
        coherence_lfp0_lfp2.(lfp0_field) = beta_coherence_val;
    end
end

% The coherence_lfp0_lfp2 struct now contains beta band coherence values
% for each pair of LFP0 and LFP2 signals.
