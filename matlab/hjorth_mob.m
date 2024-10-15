% Function to compute Hjorth Mobility
function mobility = compute_hjorth_mobility(signal)
    % Compute the first derivative of the signal
    signal_diff = diff(signal);
    
    % Compute the variance of the original signal and its derivative
    var_signal = var(signal);
    var_signal_diff = var(signal_diff);
    
    % Compute Hjorth Mobility
    mobility = sqrt(var_signal_diff / var_signal);
end

% Initialize structs to store Hjorth Mobility results
hjorth_mobility_lfp2 = struct();
hjorth_mobility_lfp0 = struct();

% Loop through patients and experiments for filtered_lfp2
fields_lfp2 = fieldnames(filtered_lfp2);
for i = 1:numel(fields_lfp2)
    % Extract the filtered signal for LFP2
    signal = filtered_lfp2.(fields_lfp2{i});
    
    % Compute Hjorth Mobility
    mobility = compute_hjorth_mobility(signal);
    
    % Store result in the struct
    hjorth_mobility_lfp2.(fields_lfp2{i}) = mobility;
end

% Loop through patients and experiments for filtered_lfp0
fields_lfp0 = fieldnames(filtered_lfp0);
for i = 1:numel(fields_lfp0)
    % Extract the filtered signal for LFP0
    signal = filtered_lfp0.(fields_lfp0{i});
    
    % Compute Hjorth Mobility
    mobility = compute_hjorth_mobility(signal);
    
    % Store result in the struct
    hjorth_mobility_lfp0.(fields_lfp0{i}) = mobility;
end
