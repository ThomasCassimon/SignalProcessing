function [even, odd] = even_odd (y)
    y_rev = fliplr(y);
    even = (y + y_rev) / 2;
    odd = (y - y_rev) / 2;
end