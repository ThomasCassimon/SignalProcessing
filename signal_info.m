%   Signal Information Script
%   Returns Peak-to-Peak value, mean, variance, RMS

function [ptp, sigMean, sigVar, sigRMS] = signal_info (y)
    ptp = max(y) - min(y);
    sigMean = mean(y);
    sigVar = mean((y - sigMean).^2);
    sigRMS = rms(y);
end