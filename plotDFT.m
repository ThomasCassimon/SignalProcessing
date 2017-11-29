function [] = plotDFT (signal, handles)
    Xp = fft(signal);

	Phi = angle(Xp);
	Mag = mag2db(abs(Xp));

	axes(handles.timeDomainPlot);
	plot([0:1:length(signal) - 1], signal, '-og', 'MarkerEdgeColor', 'Green', 'MarkerFaceColor','Green');
	title('Original Signal');
	xlabel('k');
	ylabel('x[k]');
	grid on;
	axes(handles.frequencyMagnitudePlot);
	plot([0:1:length(signal) - 1], Mag, 'o', 'MarkerEdgeColor', 'Blue', 'MarkerFaceColor','Blue');
	title('Magnitude [dB]');
	xlabel('k');
	ylabel('|X_p [k]|');
	grid on;
	axes(handles.frequencyPhasePlot);
	plot([0:1:length(signal) - 1], Phi, 'o', 'MarkerEdgeColor', 'Red', 'MarkerFaceColor','Red');
	title('Phase[°]');
	xlabel('k');
	ylabel('Arg(X_p [k])');
	grid on;
end