function [string] = generateMathChannelString(handles)
%generateMathChannelString Generates a string that represents the equation
%currently in the Math channel.
%   Detailed explanation goes here

	raw = handles.rawDataButtonGroup.SelectedObject.String
	proc = handles.processedDataButtonGroup.SelectedObject.String

	string = [raw ' raw data ' proc ' processed data'];
	
end

