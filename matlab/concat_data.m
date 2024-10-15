% Parameters
fs = 256; % Sampling frequency in Hz (adjust if needed)
low_cutoff = 13; % Low cutoff frequency in Hz
high_cutoff = 30; % High cutoff frequency in Hz

% Design the bandpass filter
[b, a] = butter(4, [low_cutoff, high_cutoff] / (fs / 2), 'bandpass');

% Load your data
% For example, p1_x1_lfp2 and p1_x1_lfp0 are your signals
% Assuming these are loaded as variables, otherwise load your data appropriately
%p1_x1_lfp2 = load('p1_x1_lfp2.mat');
%p1_x1_lfp0 = load('p1_x1_lfp0.mat');

%Patient1
% Filter the signals
filt_p1_x1_lfp2 = filter(b, a, p1_x1_lfp2);
filt_p1_x1_lfp0 = filter(b, a, p1_x1_lfp0);

filt_p1_x2_lfp2 = filter(b, a, p1_x2_lfp2);
filt_p1_x2_lfp0 = filter(b, a, p1_x2_lfp0);

%Patient2
filt_p2_x1_lfp2 = filter(b, a, p2_x1_lfp2);
filt_p2_x1_lfp0 = filter(b, a, p2_x1_lfp0);

filt_p2_x2_lfp2 = filter(b, a, p2_x2_lfp2);
filt_p2_x2_lfp0 = filter(b, a, p2_x2_lfp0);

filt_p2_x3_lfp2 = filter(b, a, p2_x3_lfp2);
filt_p2_x3_lfp0 = filter(b, a, p2_x3_lfp0);

filt_p2_x4_lfp2 = filter(b, a, p2_x4_lfp2);
filt_p2_x4_lfp0 = filter(b, a, p2_x4_lfp0);

filt_p2_x5_lfp2 = filter(b, a, p2_x5_lfp2);
filt_p2_x5_lfp0 = filter(b, a, p2_x5_lfp0);

filt_p2_x6_lfp2 = filter(b, a, p2_x6_lfp2);
filt_p2_x6_lfp0 = filter(b, a, p2_x6_lfp0);

filt_p2_x7_lfp2 = filter(b, a, p2_x7_lfp2);
filt_p2_x7_lfp0 = filter(b, a, p2_x7_lfp0);

filt_p2_x8_lfp2 = filter(b, a, p2_x8_lfp2);
filt_p2_x8_lfp0 = filter(b, a, p2_x8_lfp0);

filt_p2_x9_lfp2 = filter(b, a, p2_x9_lfp2);
filt_p2_x9_lfp0 = filter(b, a, p2_x9_lfp0);

filt_p2_x10_lfp2 = filter(b, a, p2_x10_lfp2);
filt_p2_x10_lfp0 = filter(b, a, p2_x10_lfp0);

filt_p2_x11_lfp2 = filter(b, a, p2_x11_lfp2);
filt_p2_x11_lfp0 = filter(b, a, p2_x11_lfp0);

filt_p2_x12_lfp2 = filter(b, a, p2_x12_lfp2);
filt_p2_x12_lfp0 = filter(b, a, p2_x12_lfp0);

% Patient 3
filt_p3_x1_lfp2 = filter(b, a, p3_x1_lfp2);
filt_p3_x1_lfp0 = filter(b, a, p3_x1_lfp0);

filt_p3_x2_lfp2 = filter(b, a, p3_x2_lfp2);
filt_p3_x2_lfp0 = filter(b, a, p3_x2_lfp0);

filt_p3_x3_lfp2 = filter(b, a, p3_x3_lfp2);
filt_p3_x3_lfp0 = filter(b, a, p3_x3_lfp0);

% Patient 4
filt_p4_x1_lfp2 = filter(b, a, p4_x1_lfp2);
filt_p4_x1_lfp0 = filter(b, a, p4_x1_lfp0);

filt_p4_x2_lfp2 = filter(b, a, p4_x2_lfp2);
filt_p4_x2_lfp0 = filter(b, a, p4_x2_lfp0);

filt_p4_x3_lfp2 = filter(b, a, p4_x3_lfp2);
filt_p4_x3_lfp0 = filter(b, a, p4_x3_lfp0);

filt_p4_x4_lfp2 = filter(b, a, p4_x4_lfp2);
filt_p4_x4_lfp0 = filter(b, a, p4_x4_lfp0);

filt_p4_x5_lfp2 = filter(b, a, p4_x5_lfp2);
filt_p4_x5_lfp0 = filter(b, a, p4_x5_lfp0);

filt_p4_x6_lfp2 = filter(b, a, p4_x6_lfp2);
filt_p4_x6_lfp0 = filter(b, a, p4_x6_lfp0);

% Patient 5
filt_p5_x1_lfp2 = filter(b, a, p5_x1_lfp2);
filt_p5_x1_lfp0 = filter(b, a, p5_x1_lfp0);

filt_p5_x2_lfp2 = filter(b, a, p5_x2_lfp2);
filt_p5_x2_lfp0 = filter(b, a, p5_x2_lfp0);

filt_p5_x3_lfp2 = filter(b, a, p5_x3_lfp2);
filt_p5_x3_lfp0 = filter(b, a, p5_x3_lfp0);

% Patient 6
filt_p6_x1_lfp2 = filter(b, a, p6_x1_lfp2);
filt_p6_x1_lfp0 = filter(b, a, p6_x1_lfp0);

filt_p6_x2_lfp2 = filter(b, a, p6_x2_lfp2);
filt_p6_x2_lfp0 = filter(b, a, p6_x2_lfp0);

filt_p6_x3_lfp2 = filter(b, a, p6_x3_lfp2);
filt_p6_x3_lfp0 = filter(b, a, p6_x3_lfp0);

filt_p6_x4_lfp2 = filter(b, a, p6_x4_lfp2);
filt_p6_x4_lfp0 = filter(b, a, p6_x4_lfp0);

filt_p6_x5_lfp2 = filter(b, a, p6_x5_lfp2);
filt_p6_x5_lfp0 = filter(b, a, p6_x5_lfp0);

filt_p6_x6_lfp2 = filter(b, a, p6_x6_lfp2);
filt_p6_x6_lfp0 = filter(b, a, p6_x6_lfp0);

filt_p6_x7_lfp2 = filter(b, a, p6_x7_lfp2);
filt_p6_x7_lfp0 = filter(b, a, p6_x7_lfp0);

filt_p6_x8_lfp2 = filter(b, a, p6_x8_lfp2);
filt_p6_x8_lfp0 = filter(b, a, p6_x8_lfp0);

filt_p6_x9_lfp2 = filter(b, a, p6_x9_lfp2);
filt_p6_x9_lfp0 = filter(b, a, p6_x9_lfp0);

filt_p6_x10_lfp2 = filter(b, a, p6_x10_lfp2);
filt_p6_x10_lfp0 = filter(b, a, p6_x10_lfp0);

filt_p6_x11_lfp2 = filter(b, a, p6_x11_lfp2);
filt_p6_x11_lfp0 = filter(b, a, p6_x11_lfp0);

filt_p6_x12_lfp2 = filter(b, a, p6_x12_lfp2);
filt_p6_x12_lfp0 = filter(b, a, p6_x12_lfp0);

% Patient 7
filt_p7_x1_lfp2 = filter(b, a, p7_x1_lfp2);
filt_p7_x1_lfp0 = filter(b, a, p7_x1_lfp0);

filt_p7_x2_lfp2 = filter(b, a, p7_x2_lfp2);
filt_p7_x2_lfp0 = filter(b, a, p7_x2_lfp0);

filt_p7_x3_lfp2 = filter(b, a, p7_x3_lfp2);
filt_p7_x3_lfp0 = filter(b, a, p7_x3_lfp0);

filt_p7_x4_lfp2 = filter(b, a, p7_x4_lfp2);
filt_p7_x4_lfp0 = filter(b, a, p7_x4_lfp0);

filt_p7_x5_lfp2 = filter(b, a, p7_x5_lfp2);
filt_p7_x5_lfp0 = filter(b, a, p7_x5_lfp0);

filt_p7_x6_lfp2 = filter(b, a, p7_x6_lfp2);
filt_p7_x6_lfp0 = filter(b, a, p7_x6_lfp0);

% Patient 8
filt_p8_x1_lfp2 = filter(b, a, p8_x1_lfp2);
filt_p8_x1_lfp0 = filter(b, a, p8_x1_lfp0);

filt_p8_x2_lfp2 = filter(b, a, p8_x2_lfp2);
filt_p8_x2_lfp0 = filter(b, a, p8_x2_lfp0);

filt_p8_x3_lfp2 = filter(b, a, p8_x3_lfp2);
filt_p8_x3_lfp0 = filter(b, a, p8_x3_lfp0);

filt_p8_x4_lfp2 = filter(b, a, p8_x4_lfp2);
filt_p8_x4_lfp0 = filter(b, a, p8_x4_lfp0);

filt_p8_x5_lfp2 = filter(b, a, p8_x5_lfp2);
filt_p8_x5_lfp0 = filter(b, a, p8_x5_lfp0);

filt_p8_x6_lfp2 = filter(b, a, p8_x6_lfp2);
filt_p8_x6_lfp0 = filter(b, a, p8_x6_lfp0);

% Patient 9
filt_p9_x1_lfp2 = filter(b, a, p9_x1_lfp2);
filt_p9_x1_lfp0 = filter(b, a, p9_x1_lfp0);

filt_p9_x2_lfp2 = filter(b, a, p9_x2_lfp2);
filt_p9_x2_lfp0 = filter(b, a, p9_x2_lfp0);

filt_p9_x3_lfp2 = filter(b, a, p9_x3_lfp2);
filt_p9_x3_lfp0 = filter(b, a, p9_x3_lfp0);

filt_p9_x4_lfp2 = filter(b, a, p9_x4_lfp2);
filt_p9_x4_lfp0 = filter(b, a, p9_x4_lfp0);

filt_p9_x5_lfp2 = filter(b, a, p9_x5_lfp2);
filt_p9_x5_lfp0 = filter(b, a, p9_x5_lfp0);

filt_p9_x6_lfp2 = filter(b, a, p9_x6_lfp2);
filt_p9_x6_lfp0 = filter(b, a, p9_x6_lfp0);

filt_p9_x7_lfp2 = filter(b, a, p9_x7_lfp2);
filt_p9_x7_lfp0 = filter(b, a, p9_x7_lfp0);

filt_p9_x8_lfp2 = filter(b, a, p9_x8_lfp2);
filt_p9_x8_lfp0 = filter(b, a, p9_x8_lfp0);

filt_p9_x9_lfp2 = filter(b, a, p9_x9_lfp2);
filt_p9_x9_lfp0 = filter(b, a, p9_x9_lfp0);

filt_p9_x10_lfp2 = filter(b, a, p9_x10_lfp2);
filt_p9_x10_lfp0 = filter(b, a, p9_x10_lfp0);

filt_p9_x11_lfp2 = filter(b, a, p9_x11_lfp2);
filt_p9_x11_lfp0 = filter(b, a, p9_x11_lfp0);

filt_p9_x12_lfp2 = filter(b, a, p9_x12_lfp2);
filt_p9_x12_lfp0 = filter(b, a, p9_x12_lfp0);

% Patient 10
filt_p10_x1_lfp2 = filter(b, a, p10_x1_lfp2);
filt_p10_x1_lfp0 = filter(b, a, p10_x1_lfp0);

filt_p10_x2_lfp2 = filter(b, a, p10_x2_lfp2);
filt_p10_x2_lfp0 = filter(b, a, p10_x2_lfp0);

filt_p10_x3_lfp2 = filter(b, a, p10_x3_lfp2);
filt_p10_x3_lfp0 = filter(b, a, p10_x3_lfp0);

filt_p10_x4_lfp2 = filter(b, a, p10_x4_lfp2);
filt_p10_x4_lfp0 = filter(b, a, p10_x4_lfp0);

filt_p10_x5_lfp2 = filter(b, a, p10_x5_lfp2);
filt_p10_x5_lfp0 = filter(b, a, p10_x5_lfp0);

filt_p10_x6_lfp2 = filter(b, a, p10_x6_lfp2);
filt_p10_x6_lfp0 = filter(b, a, p10_x6_lfp0);

filt_p10_x7_lfp2 = filter(b, a, p10_x7_lfp2);
filt_p10_x7_lfp0 = filter(b, a, p10_x7_lfp0);

filt_p10_x8_lfp2 = filter(b, a, p10_x8_lfp2);
filt_p10_x8_lfp0 = filter(b, a, p10_x8_lfp0);

% Patient 11
filt_p11_x1_lfp2 = filter(b, a, p11_x1_lfp2);
filt_p11_x1_lfp0 = filter(b, a, p11_x1_lfp0);

filt_p11_x2_lfp2 = filter(b, a, p11_x2_lfp2);
filt_p11_x2_lfp0 = filter(b, a, p11_x2_lfp0);

filt_p11_x3_lfp2 = filter(b, a, p11_x3_lfp2);
filt_p11_x3_lfp0 = filter(b, a, p11_x3_lfp0);

filt_p11_x4_lfp2 = filter(b, a, p11_x4_lfp2);
filt_p11_x4_lfp0 = filter(b, a, p11_x4_lfp0);

filt_p11_x5_lfp2 = filter(b, a, p11_x5_lfp2);
filt_p11_x5_lfp0 = filter(b, a, p11_x5_lfp0);

filt_p11_x6_lfp2 = filter(b, a, p11_x6_lfp2);
filt_p11_x6_lfp0 = filter(b, a, p11_x6_lfp0);

filt_p11_x7_lfp2 = filter(b, a, p11_x7_lfp2);
filt_p11_x7_lfp0 = filter(b, a, p11_x7_lfp0);

filt_p11_x8_lfp2 = filter(b, a, p11_x8_lfp2);
filt_p11_x8_lfp0 = filter(b, a, p11_x8_lfp0);

filt_p11_x9_lfp2 = filter(b, a, p11_x9_lfp2);
filt_p11_x9_lfp0 = filter(b, a, p11_x9_lfp0);

% Patient 12
filt_p12_x1_lfp2 = filter(b, a, p12_x1_lfp2);
filt_p12_x1_lfp0 = filter(b, a, p12_x1_lfp0);

filt_p12_x2_lfp2 = filter(b, a, p12_x2_lfp2);
filt_p12_x2_lfp0 = filter(b, a, p12_x2_lfp0);

filt_p12_x3_lfp2 = filter(b, a, p12_x3_lfp2);
filt_p12_x3_lfp0 = filter(b, a, p12_x3_lfp0);

filt_p12_x4_lfp2 = filter(b, a, p12_x4_lfp2);
filt_p12_x4_lfp0 = filter(b, a, p12_x4_lfp0);

filt_p12_x5_lfp2 = filter(b, a, p12_x5_lfp2);
filt_p12_x5_lfp0 = filter(b, a, p12_x5_lfp0);

filt_p12_x6_lfp2 = filter(b, a, p12_x6_lfp2);
filt_p12_x6_lfp0 = filter(b, a, p12_x6_lfp0);

filt_p12_x7_lfp2 = filter(b, a, p12_x7_lfp2);
filt_p12_x7_lfp0 = filter(b, a, p12_x7_lfp0);

filt_p12_x8_lfp2 = filter(b, a, p12_x8_lfp2);
filt_p12_x8_lfp0 = filter(b, a, p12_x8_lfp0);



