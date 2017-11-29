function [result] = zero_pad_frequency (signal, desiredLength)
    result = [zeros(1, floor((desiredLength - length(signal)) / 2)) signal zeros(1, ceil((desiredLength - length(signal)) / 2))];
end