function [settings] = LoadSettings(settingsFile, handles)
%   LoadSettings Loads Settings from a file
%   The file is a valid JSON file.
%	This file is saved everytime the user presses "Save and Apply" in the
%	settings window.

	settings = jsondecode(fileread(settingsFile));
	
	WindowFunctions = ["Rectangle Window","Bartlett Window","Hann Window","Hamming Window","Blackman Window","Flat Top Window"];

	if (sum(WindowFunctions == settings.WindowFunction) <= 0)
		fprintf('Unknown Window Function: "%s", Choosing Hamming window.\n', settings.WindowFunction);
		settings.WindowFunction = "Hamming";
    end
    
    get(handles.windowFunctionGroup, 'selectedob')
    
    %set the selected object in the radio button group to the right button
   switch settings.WindowFunction
       case "Rectangle Window"
           set(handles.windowFunctionGroup,'selectedob', handles.rectangleWindow);
       case "Bartlett Window"
           set(handles.windowFunctionGroup,'selectedob', handles.bartlettWindow);
       case "Hann Window"
           set(handles.windowFunctionGroup,'selectedob', handles.hannWindow);
       case "Hamming Window"
           set(handles.windowFunctionGroup,'selectedob', handles.hammingWindow);
       case "Blackman Window"
           set(handles.windowFunctionGroup,'selectedob', handles.blackmanWindow);
       case "Flat Top Window"           
           set(handles.windowFunctionGroup,'selectedob', handles.flatTopWindow)
       otherwise
           fprintf('Wrong window function argument');   
   end
end

