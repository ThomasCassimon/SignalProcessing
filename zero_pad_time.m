function [result] = zero_pad_time (signal, desiredLength)
    result = [signal zeros(1, desiredLength - length(signal))];
end