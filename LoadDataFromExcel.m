function [dataset, sampleFreq] = LoadDataFromExcel()
%LoadDataFromExcel This function loads a dataset from a Microsoft Excel
%file
%	filename is the name of the Excel file.

	[filename,pathname] = uigetfile({'*.xls*';'*.csv'});
 
	filename = strcat(pathname, filename);

	if not (filename == 0)
		dataset = xlsread(filename);
		
		sampleFreq = dataset(9,1);

		dataset = dataset(10:end,1:end);
	end
end

