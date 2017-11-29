function [] = plotDFT (signal, handles)
    Xp = fft(signal);

	Phi = phase(Xp);
	Mag = mag2db(abs(Xp));

	axes(handles.timeDomainPlot);
	plot([0:1:length(signal) - 1], signal, '-og', 'MarkerEdgeColor', 'Green', 'MarkerFaceColor','Green');
	title('Original Signal');
	xlabel('n');
	ylabel('x[n]');
	grid on;
	axes(handles.frequencyMagnitudePlot);
	plot([0:1:length(signal) - 1], Mag, 'o', 'MarkerEdgeColor', 'Blue', 'MarkerFaceColor','Blue');
	title('Magnitude [dB]');
	xlabel('n');
	ylabel('|X_p [n]|');
	grid on;
	axes(handles.frequencyPhasePlot);
	plot([0:1:length(signal) - 1], Phi, 'o', 'MarkerEdgeColor', 'Red', 'MarkerFaceColor','Red');
	title('Phase[°]');
	xlabel('n');
	ylabel('Arg(X_p [n])');
	grid on;
end