function [result] = zero_pad_time (signal, desiredLength)
    result = [signal ; zeros(desiredLength - length(signal), 1)];
end