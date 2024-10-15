% Function to compute Skewness manually
function skew = compute_skewness(signal)
    n = length(signal);
    mean_val = mean(signal);
    std_dev = std(signal);
    
    % Avoid division by zero if std_dev is zero
    if std_dev == 0
        skew = NaN;
    else
        skew = (n / ((n-1)*(n-2))) * sum(((signal - mean_val) / std_dev) .^ 3);
    end
end

% Initialize structs to store Skewness results
skewness_lfp2 = struct();
skewness_lfp0 = struct();

% Loop through patients and experiments for filtered_lfp2
fields_lfp2 = fieldnames(filtered_lfp2);
for i = 1:numel(fields_lfp2)
    % Extract the filtered signal for LFP2
    signal = filtered_lfp2.(fields_lfp2{i});
    
    % Compute Skewness
    skew = compute_skewness(signal);
    
    % Store result in the struct
    skewness_lfp2.(fields_lfp2{i}) = skew;
end

% Loop through patients and experiments for filtered_lfp0
fields_lfp0 = fieldnames(filtered_lfp0);
for i = 1:numel(fields_lfp0)
    % Extract the filtered signal for LFP0
    signal = filtered_lfp0.(fields_lfp0{i});
    
    % Compute Skewness
    skew = compute_skewness(signal);
    
    % Store result in the struct
    skewness_lfp0.(fields_lfp0{i}) = skew;
end
