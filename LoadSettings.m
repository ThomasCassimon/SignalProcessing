function [settings] = LoadSettings(settingsFile)
%LoadSettings Loads Settings from a file
%   The file is a valid JSON file.
%	This file is saved everytime the user presses "Save and Apply" in the
%	settings window.

	settings = jsondecode(fileread(settingsFile));
	
	WindowFunctions = ["Rectangle","Bartlett","Hann","Hamming","Blackman","Kaiser","Nuttall","Blackman-Harris","Blackman-Nuttall","Flat_Top"];
	NoiseRemovalMethods = ["ProcessingGain", "IntegrationGain"];

	if (sum(WindowFunctions == settings.WindowFunction) <= 0)
		fprintf('Unknown Window Function: "%s", Choosing Hamming window.\n', settings.WindowFunction);
		settings.WindowFunction = "Hamming";
	end

	if (sum(NoiseRemovalMethods == settings.NoiseRemovalMethod) <= 0)
		fprintf('Unknown Noise Removal Method: "%s", Choosing processing gain with 400%%.\n', settings.NoiseRemovalMethod);
		settings.NoiseRemovalMethod = "ProcessingGain";
		settings.ProcessingGainPercentage = 400;
	end
end

