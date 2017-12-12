function [] = SaveSettings(settingsFile, handles)
%SaveSettings Save settings to settingsFile
%   settingsFile is the file to save to
%	handles are a bunch of handles to the UI

settings = struct;

settings.WindowFunction = handles.windowFunctionGroup.SelectedObject.String;
settings.NoiseRemovalMethod = handles.noiseRemovalGroup.SelectedObject.String;
settings.ProcessingGainPercentage = get(handles.processingGainEdit, 'String');
settings.IntegrationGainNumRuns = get(handles.integrationGainEdit, 'String');

json = jsonencode(settings);

fid = fopen(settingsFile, 'w');
fprintf(fid, '%s', json);
fclose(fid);

end

