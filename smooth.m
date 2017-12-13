function [smoothedData] = smooth(data,method)
%smooth Smooth's data using the given method
%	data is the data to be smoothed
%   Possible methods are {'Quadratic Regression','Robust Quadratic Regression','Savitzky-Golay Filter'}

	switch method
		case 'Quadratic Regression'
			smoothedData = smoothdata(data,'loess');
			
		case 'Robust Quadratic Regression'
			smoothedData = smoothdata(data,'rloess');
			
		case 'Savitzky-Golay Filter'
			smoothedData = smoothdata(data, 'sgolay');
			
		otherwise
			fprintf('Unknown smoothing method "%s"\n', method);
			smoothedData = data;
	end
end