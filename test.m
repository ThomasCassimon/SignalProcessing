clear;
close all;
clc;

settings = LoadSettings('Settings.json');
fprintf('Noise Removal Method: %s\n', settings.NoiseRemovalMethod);

