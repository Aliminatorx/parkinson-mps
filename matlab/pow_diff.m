% power difference

% Initialize a structure to store the power differences for all patients
power_diff = struct();

for p = 1:numPatients
    for t = 1:numTrialsPerPatient(p)
        % Calculate the power difference (LFP2 - LFP0)
        power_diff.(sprintf('pd_p%d_x%d', p, t)) = ...
            beta_power_lfp2.(sprintf('bp_p%d_x%d', p, t)) - ...
            beta_power_lfp0.(sprintf('bp_p%d_x%d', p, t));
    end
end
