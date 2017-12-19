function [mathSignal] = generateMathChannel(rawSignal, processedSignal, handles)
%applyMathChannel applies the operations specified in the math data panel
%to the given signal.

	dataPlus = get(handles.mathData_DataPlus, 'Value');
	dataMinus = get(handles.mathData_DataMinus, 'Value');
	
	if dataPlus == 1 && dataMinus == 0
		%rawSignal = rawSignal;
	elseif dataPlus == 0 && dataMinus == 1
		rawSignal = -rawSignal;
	end
	
	processedDataPlus = get(handles.mathData_PDataPlus, 'Value');
	processedDataMinus = get(handles.mathData_PDataMinus, 'Value');
	processedDataMult = get(handles.mathData_PDataMultiply, 'Value');
	processedDataDiv = get(handles.mathData_PDataDivide, 'Value');
	
	if processedDataPlus == 1 && processedDataMinus == 0 && processedDataMult == 0 && processedDataDiv == 0
		mathSignal = rawSignal + processedSignal;
	elseif processedDataPlus == 0 && processedDataMinus == 1 && processedDataMult == 0 && processedDataDiv == 0
		mathSignal = rawSignal - processedSignal;
	elseif processedDataPlus == 0 && processedDataMinus == 0 && processedDataMult == 1 && processedDataDiv == 0
		mathSignal = rawSignal .* processedSignal;
	elseif processedDataPlus == 0 && processedDataMinus == 0 && processedDataMult == 0 && processedDataDiv == 1
		mathSignal = rawSignal ./ processedSignal;
	else
		mathSignal = zeros(1,length(rawSignal));
	end
end

