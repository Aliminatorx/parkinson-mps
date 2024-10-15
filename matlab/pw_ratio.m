% power_ratio

% Initialize a structure to store the power ratios for all patients
power_ratio = struct();

for p = 1:numPatients
    for t = 1:numTrialsPerPatient(p)
        % Calculate the power ratio (LFP2 / LFP0)
        power_ratio.(sprintf('pr_p%d_x%d', p, t)) = ...
            beta_power_lfp2.(sprintf('bp_p%d_x%d', p, t)) / ...
            beta_power_lfp0.(sprintf('bp_p%d_x%d', p, t));
    end
end
