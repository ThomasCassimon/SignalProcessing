function [] = SaveDataToExcel(signal, sampleFreq, handles)
%SaveDataToExcel Save data to excel file
%   Detailed explanation goes here

	[filename,pathname] = uiputfile({'.xlsx'});

	processedSignal = generateProcessedChannel(signal, handles);
	mathSignal = generateMathChannel(signal, processedSignal, handles);
	
	data = [(1:1:length(signal))' signal processedSignal mathSignal];
	
	header = {
		filename,'','','';
		'Date and Time',datetime('now'),'','';
		'Window Function',handles.windowFunctionGroup.SelectedObject.String,'','';
		'Smoothing Function',handles.smoothingPanel.SelectedObject.String,'','';
		'','','','';
		'','','','';
		'','','','';
		'Sample Frequency','','','';
		'250','Hz','','';
		'Sample Number','Original Data','Processed Data','Math Data';
	};
	
	data =  mat2cell(data, ones(size(data,1),1), ones(size(data,2),1));
	data = [header ; data];
	
	if (not(filename == 0))		
		filename = strcat(pathname, filename);
		
		if(not(filename == 0))
			xlswrite(filename, data);
		end
	end
	
end

