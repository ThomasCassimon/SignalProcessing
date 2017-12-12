function [] = plotDFT (signal, handles)

	settings = LoadSettings('Settings.json');
	SaveSettings('Settings.json', handles);
	%win = ones(1, length(signal));
	
	%if(settings.WindowFunction == "Rectangle")
	%	win = rectwin(length(signal));
	%end

    fprintf('plotting...\n');
	settings = LoadSettings('Settings.json');
    
    Xp = fft(signal);

	Phi = angle(Xp);
	Mag = mag2db(abs(Xp));
    
    K = [0:1:length(signal)-1];
    
    
   %DETERMINE WINDOW FUNCTION
   switch settings.WindowFunction
       case "Rectangle"
           window = rectwin(length(signal));
           fprintf('Rectangle');
       case "Bartlett"
           window = bartlett(length(signal));
           fprintf('Bartlett');
       case "Hann"
           window = hann(length(signal));
           fprintf('Hann');
       case "Hamming"
           window = hamming(length(signal));
           fprintf('Hamming');
       case "Blackman"
           window = blackman(length(signal));
           fprintf('Blackman');
       case "Kaiser"
           fprintf('Kaiser');
       case "Nuttal"
           fprintf('Nuttal');
       case "Blackman-Harris"
           fprintf('Blackman-Harris');
       case "Blackman-Nuttal"
           fprintf('Blackman-Nuttal');
       case "Flat-Top"
           fprintf('Flat-Top');
       otherwise
           fprintf('Wrong window function argument');   
   end
   
   showProcessed = get(handles.processedData, 'Value');
   showRaw = get(handles.rawData, 'Value');
   
   fprintf('Raw data %d, Processed data %d\n', showRaw, showProcessed);
   
   processedSignal = signal * window;
   
    XpProcessed = fft(processedSignal);
    PhiProcessed = angle(XpProcessed);
	MagProcessed = mag2db(abs(XpProcessed));
   
	axes(handles.timeDomainPlot);
    cla;
    if showRaw == 1
        plot(K, signal, '-og', 'MarkerEdgeColor', 'Blue', 'MarkerFaceColor','Blue','Color','Blue', 'MarkerSize', 2);
        hold on;
        %plot(K,signal,K,processedSignal,'Color','Red','Color','Blue');
    end
    if showProcessed == 1 
        plot(K, processedSignal, '-og', 'MarkerEdgeColor', 'Red', 'MarkerFaceColor','Red','Color','Red', 'MarkerSize', 2);
         %plot(K,processedSignal, 'Color', 'Red');
    end
    if showRaw == 1 && showProcessed == 1
         %plot(K, signal, 'Color', 'Blue');
         legend('Raw data', 'Processed data');
    end
    hold off;
    
    
    
    title('Time Domain');
    xlabel('k');
    ylabel('x[k]');
    grid on;
    
    K = K./2*pi;
    
	axes(handles.frequencyMagnitudePlot);
    
    %if(showRaw == 1)
        plot(K, Mag, 'o', 'MarkerEdgeColor','Blue', 'MarkerFaceColor','Blue', 'MarkerSize', 2);
     %   hold on;
    %end
    %if(showProcessed == 1)
    %    plot(K, MagProcessed, 'o', 'MarkerEdgeColor','Red', 'MarkerFaceColor','Red', 'MarkerSize', 2);
    %end
    %hold off;
    
    %if(showRaw == 1 && showProcessed == 1)
    %    legend('Raw data', 'Processed data');
    %end
 
  
	title('Magnitude [dB]');
	xlabel('\omega');
	ylabel('|X_p [k]|');
	grid on;
    
    
	axes(handles.frequencyPhasePlot);
	plot(K, Phi, 'o', 'MarkerEdgeColor', 'Red', 'MarkerFaceColor','Red', 'MarkerSize', 2);
    
	title('Phase[°]');
	xlabel('\omega');
	ylabel('Arg(X_p [k])');
	grid on;
end