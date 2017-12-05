function [] = plotDFT (signal, handles)
	%settings = LoadSettings('Settings.json');
	
	%win = ones(1, length(signal));
	
	%if(settings.WindowFunction == "Rectangle")
	%	win = rectwin(length(signal));
	%end

	%signal = signal .* win;
	
	%signal
	
    Xp = fft(signal);

	Phi = angle(Xp);
	Mag = mag2db(abs(Xp));
    
    K = [0:1:length(signal)-1];
    
    
   %DETERMINE WINDOW FUNCTION
   switch settings.WindowFunction
       case "Rectangle"
           window = rectwin(length(signal));
           printf('Rectangle');
       case "Bartlett"
           window = bartlett(length(signal));
           printf('Bartlett');
       
       
       
   end

	axes(handles.timeDomainPlot);
	plot(K, signal, '-og', 'MarkerEdgeColor', 'Green', 'MarkerFaceColor','Green', 'MarkerSize', 2);
	title('Original Signal');
	xlabel('k');
	ylabel('x[k]');
	grid on;
    
    K = K./2*pi;
    
	axes(handles.frequencyMagnitudePlot);
	plot(K, Mag, 'o', 'MarkerEdgeColor', 'Blue', 'MarkerFaceColor','Blue', 'MarkerSize', 2);
	title('Magnitude [dB]');
	xlabel('\omega');
	ylabel('|X_p [k]|');
	grid on;
	axes(handles.frequencyPhasePlot);
	plot(K, Phi, 'o', 'MarkerEdgeColor', 'Red', 'MarkerFaceColor','Red', 'MarkerSize', 2);
	title('Phase[�]');
	xlabel('\omega');
	ylabel('Arg(X_p [k])');
	grid on;
end