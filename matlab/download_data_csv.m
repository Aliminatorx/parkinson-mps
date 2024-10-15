%download data in csv form

% Define the structs to export
structs = {'beta_power_lfp2', 'beta_power_lfp0', 'power_diff', 'power_ratio', 'beta_peak_freq_lfp0', 'beta_peak_freq_lfp2', 'mpc_data','hjorth_mobility_lfp0', 'hjorth_mobility_lfp2','skewness_lfp0','skewness_lfp2','kurtosis_lfp0','kurtosis_lfp2','entropy_lfp0', 'entropy_lfp2','coherence_lfp0_lfp2','mean_beta_burst_duration_lfp0', 'mean_beta_burst_duration_lfp2','beta_power_asymmetry','pac_lfp0','pac_lfp2','beta_power_stability_lfp0','beta_power_stability_lfp2','cfc_lfp0','cfc_lfp2','plv_lfp0','plv_lfp2'};

% Loop over each struct and export to CSV
for i = 1:length(structs)
    % Get the current struct name
    structName = structs{i};
    
    % Load the struct from the workspace
    s = eval(structName);
    
    % Convert the struct to a table
    tbl = struct2table(s);
    
    % Define the file name
    csvFileName = sprintf('%s.csv', structName);
    
    % Write the table to a CSV file
    writetable(tbl, csvFileName);
end
