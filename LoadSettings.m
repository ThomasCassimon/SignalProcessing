function [settings] = LoadSettings(settingsFile, handles)
%   LoadSettings Loads Settings from a file
%   The file is a valid JSON file.
%	This file is saved everytime the user presses "Save and Apply" in the
%	settings window.

	settings = jsondecode(fileread(settingsFile));
	
	WindowFunctions = ["Rectangle Window","Bartlett Window","Hann Window","Hamming Window","Blackman Window","Flat Top Window"];
	SmoothingFunctions = ["Quadratic Regression", "Robust Quadratic Regression", "Savitzky-Golay Filter"];
	

	if (sum(WindowFunctions == settings.WindowFunction) <= 0)
		%fprintf('Unknown Window Function: "%s", Choosing Hamming window.\n', settings.WindowFunction);
		settings.WindowFunction = "Hamming";
	end

	if (sum(SmoothingFunctions == settings.SmoothingFunction) <= 0)
		%fprintf('Unknown Noise Removal Method: "%s", Choosing processing gain with 400%%.\n', settings.NoiseRemovalMethod);
		settings.SmoothingFunction = "Savitzky-Golay Filter";
	end
end

