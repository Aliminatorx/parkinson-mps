% Define a function to compute Beta Power Asymmetry
function beta_power_asymmetry = compute_beta_power_asymmetry(beta_power_lfp2, beta_power_lfp0)
    % Ensure the inputs are scalar
    assert(isscalar(beta_power_lfp2) && isscalar(beta_power_lfp0), 'Inputs must be scalars.');

    % Compute Beta Power Asymmetry
    beta_power_asymmetry = (beta_power_lfp2 - beta_power_lfp0) / (beta_power_lfp2 + beta_power_lfp0);
end

% Example usage with your structs
num_patients = 12;
num_experiments = [2, 12, 3, 6, 3, 12, 6, 6, 12, 8, 9, 8]; % Adjust the number of experiments per patient

% Initialize structure to store Beta Power Asymmetry
beta_power_asymmetry = struct();

for patient = 1:num_patients
    for experiment = 1:num_experiments(patient)
        % Construct field names
        lfp2_field = sprintf('bp_p%d_x%d', patient, experiment); % beta_power_lfp2 field name
        lfp0_field = sprintf('bp_p%d_x%d', patient, experiment); % beta_power_lfp0 field name

        % Check if fields exist in the structs
        if isfield(beta_power_lfp2, lfp2_field) && isfield(beta_power_lfp0, lfp0_field)
            % Get beta power values
            beta_power_lfp2_val = beta_power_lfp2.(lfp2_field);
            beta_power_lfp0_val = beta_power_lfp0.(lfp0_field);

            % Compute Beta Power Asymmetry
            beta_power_asymmetry.(sprintf('asym_p%d_x%d', patient, experiment)) = compute_beta_power_asymmetry(beta_power_lfp2_val, beta_power_lfp0_val);
        end
    end
end

% Prepare data for CSV
field_names = fieldnames(beta_power_asymmetry);
data = cell(length(field_names), 2); % Initialize cell array

for i = 1:length(field_names)
    % Extract field data
    data{i, 1} = field_names{i};
    data{i, 2} = num2str(beta_power_asymmetry.(field_names{i}));
end

% Write to CSV
cell2csv('beta_power_asymmetry.csv', data);

% Helper function to write cell array to CSV
function cell2csv(filename, cellArray)
    fid = fopen(filename, 'w');
    [nRows, nCols] = size(cellArray);
    for row = 1:nRows
        for col = 1:nCols
            if col > 1
                fprintf(fid, ',');
            end
            fprintf(fid, '%s', cellArray{row, col});
        end
        fprintf(fid, '\n');
    end
    fclose(fid);
end
