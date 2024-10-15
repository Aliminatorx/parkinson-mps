% Function to compute Kurtosis manually
function kurt = compute_kurtosis(signal)
    n = length(signal);
    mean_val = mean(signal);
    std_dev = std(signal);
    
    % Avoid division by zero if std_dev is zero
    if std_dev == 0
        kurt = NaN;
    else
        % Kurtosis formula
        kurt = ((n*(n+1)) / ((n-1)*(n-2)*(n-3))) * sum(((signal - mean_val) / std_dev) .^ 4) ...
            - (3 * (n-1)^2) / ((n-2)*(n-3));
    end
end

% Initialize structs to store Kurtosis results
kurtosis_lfp2 = struct();
kurtosis_lfp0 = struct();

% Loop through patients and experiments for filtered_lfp2
fields_lfp2 = fieldnames(filtered_lfp2);
for i = 1:numel(fields_lfp2)
    % Extract the filtered signal for LFP2
    signal = filtered_lfp2.(fields_lfp2{i});
    
    % Compute Kurtosis (you can use either method, built-in or manual)
    if exist('kurtosis', 'file')  % Use built-in if available
        kurt = kurtosis(signal);
    else  % Manually calculate if the built-in function is not available
        kurt = compute_kurtosis(signal);
    end
    
    % Store result in the struct
    kurtosis_lfp2.(fields_lfp2{i}) = kurt;
end

% Loop through patients and experiments for filtered_lfp0
fields_lfp0 = fieldnames(filtered_lfp0);
for i = 1:numel(fields_lfp0)
    % Extract the filtered signal for LFP0
    signal = filtered_lfp0.(fields_lfp0{i});
    
    % Compute Kurtosis
    if exist('kurtosis', 'file')  % Use built-in if available
        kurt = kurtosis(signal);
    else  % Manually calculate if the built-in function is not available
        kurt = compute_kurtosis(signal);
    end
    
    % Store result in the struct
    kurtosis_lfp0.(fields_lfp0{i}) = kurt;
end
