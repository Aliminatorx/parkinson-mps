% Function to compute Shannon Entropy
function entropy_val = compute_shannon_entropy(signal)
    % Normalize signal to have values between 0 and 1
    signal = signal - min(signal);
    signal = signal / max(signal);
    
    % Discretize the signal into a histogram with 100 bins
    num_bins = 100;
    [counts, ~] = histcounts(signal, num_bins);
    
    % Normalize counts to obtain probabilities
    probabilities = counts / sum(counts);
    
    % Remove zero probabilities to avoid log(0)
    probabilities(probabilities == 0) = [];
    
    % Compute Shannon entropy
    entropy_val = -sum(probabilities .* log2(probabilities));
end

% Initialize structs to store Shannon Entropy results
entropy_lfp2 = struct();
entropy_lfp0 = struct();

% Loop through patients and experiments for filtered_lfp2
fields_lfp2 = fieldnames(filtered_lfp2);
for i = 1:numel(fields_lfp2)
    % Extract the filtered signal for LFP2
    signal = filtered_lfp2.(fields_lfp2{i});
    
    % Compute Shannon Entropy
    entropy_val = compute_shannon_entropy(signal);
    
    % Store result in the struct
    entropy_lfp2.(fields_lfp2{i}) = entropy_val;
end

% Loop through patients and experiments for filtered_lfp0
fields_lfp0 = fieldnames(filtered_lfp0);
for i = 1:numel(fields_lfp0)
    % Extract the filtered signal for LFP0
    signal = filtered_lfp0.(fields_lfp0{i});
    
    % Compute Shannon Entropy
    entropy_val = compute_shannon_entropy(signal);
    
    % Store result in the struct
    entropy_lfp0.(fields_lfp0{i}) = entropy_val;
end

% The entropy_lfp0 and entropy_lfp2 structs now contain Shannon entropy
% values for each filtered LFP0 and LFP2 signal.
