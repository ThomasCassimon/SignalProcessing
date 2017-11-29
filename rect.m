function [ y ] = rect(N, lower, upper, step)
	x = [0:step:N-1];
	y1 = x > N*lower;
	y2 = x < N*upper;
	y = y1 & y2;
end

