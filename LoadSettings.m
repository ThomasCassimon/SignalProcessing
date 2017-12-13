function [settings] = LoadSettings(settingsFile, handles)
%   LoadSettings Loads Settings from a file
%   The file is a valid JSON file.
%	This file is saved everytime the user presses "Save and Apply" in the
%	settings window.

	settings = jsondecode(fileread(settingsFile));
	
	WindowFunctions = ["Rectangle Window","Bartlett Window","Hann Window","Hamming Window","Blackman Window","Flat Top Window"];

	if (sum(WindowFunctions == settings.WindowFunction) <= 0)
		%fprintf('Unknown Window Function: "%s", Choosing Hamming window.\n', settings.WindowFunction);
		settings.WindowFunction = "Hamming";
    end
    
    %set(handles.windowFunctionGroup.SelectedObject,'String', settings.WindowFunction);
    get(handles.windowFunctionGroup.SelectedObject, 'String')
    set(handles.windowFunctionGroup.SelectedObject,'String', settings.WindowFunction);
end

