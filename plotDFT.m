function [] = plotDFT (signal, handles)

	settings = LoadSettings('Settings.json',handles);
    sampleFreq = get(handles.dataTable, 'sampleFreq')
	SaveSettings('Settings.json', handles);


    fprintf('plotting...\n');
	settings = LoadSettings('Settings.json');
    
    Xp = fft(signal);

	Phi = angle(Xp);
	Mag = mag2db(abs(Xp));
    
    K = [0:1:length(signal)-1];
    
    
   %DETERMINE WINDOW FUNCTION
   switch settings.WindowFunction
       case "Rectangle Window"
           window = rectwin(length(signal));
           fprintf('Rectangle Window');
       case "Bartlett Window"
           window = bartlett(length(signal));
           fprintf('Bartlett Window');
       case "Hann Window"
           window = hann(length(signal));
           fprintf('Hann Window');
       case "Hamming Window"
           window = hamming(length(signal));
           fprintf('Hamming Window');
       case "Blackman Window"
           window = blackman(length(signal));
           fprintf('Blackman Window');
       case "Flat Top Window"
           window = flattopwin(length(signal));
           fprintf('Flat Top Window');
       otherwise
           fprintf('Wrong window function argument');   
   end
   
   showProcessed = get(handles.processedData, 'Value');
   showRaw = get(handles.rawData, 'Value');
   
   fprintf('Raw data %d, Processed data %d\n', showRaw, showProcessed);
   processedSignal = signal .* window;
   
    XpProcessed = fft(processedSignal);
    PhiProcessed = angle(XpProcessed);
	MagProcessed = mag2db(abs(XpProcessed));
   
    
    %TIME DOMAIN PLOT
	axes(handles.timeDomainPlot);
    cla;
    if showRaw == 1
        plot(K, signal, '-og', 'MarkerEdgeColor', 'Blue', 'MarkerFaceColor','Blue','Color','Blue', 'MarkerSize', 2);
        legend('Raw data');
        hold on;
    end
    if showProcessed == 1 
        plot(K, processedSignal, '-og', 'MarkerEdgeColor', 'Red', 'MarkerFaceColor','Red','Color','Red', 'MarkerSize', 2);
        legend('Processed data');
    end
    if showRaw == 1 && showProcessed == 1
        legend('Raw data', 'Processed data');
    end
    hold off;
    
    title('Time Domain');
    xlabel('k');
    ylabel('x[k]');
    grid on;
    
    
    
    K = K .* ((2*pi*sampleFreq)/length(K));
   
    
    %MAGNITUDE PLOT
	axes(handles.frequencyMagnitudePlot);
    cla;
    if(showRaw == 1)
        plot(K, Mag, 'o', 'MarkerEdgeColor','Blue', 'MarkerFaceColor','Blue', 'MarkerSize', 2);
        legend('Raw data');
        hold on;
    end
    if(showProcessed == 1)
        plot(K, MagProcessed, 'o', 'MarkerEdgeColor','Red', 'MarkerFaceColor','Red', 'MarkerSize', 2);
        legend('Processed data');
    end
    if(showRaw == 1 && showProcessed == 1)
        legend('Raw data', 'Processed data');
    end
    hold off;
  
	title('Magnitude [dB]');
	xlabel('\omega');
	ylabel('|X_p [k]|');
	grid on;
    
    
    %PHASE PLOT
	axes(handles.frequencyPhasePlot);
    cla;
    
    if(showRaw == 1)
        plot(K, Phi, 'o', 'MarkerEdgeColor', 'Blue', 'MarkerFaceColor','Blue', 'MarkerSize', 2);
        hold on;
        legend('Raw data');
    end
    if(showProcessed == 1)
        plot(K, Phi, 'o', 'MarkerEdgeColor', 'Red', 'MarkerFaceColor','Red', 'MarkerSize', 2);
        legend('Processed data');
    end 
    hold off;
    if(showProcessed == 1 && showRaw == 1)
        legend('Raw data', 'Processed data');
    end
	
    
	title('Phase[°]');
	xlabel('\omega');
	ylabel('Arg(X_p [k])');
	grid on;
end