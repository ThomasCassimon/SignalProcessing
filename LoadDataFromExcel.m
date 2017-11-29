function [dataset] = LoadDataFromExcel(filename)
%LoadDataFromExcel This function loads a dataset from a Microsoft Excel
%file
%	filename is the name of the Excel file.

	dataset = xlsread(filename);
end

