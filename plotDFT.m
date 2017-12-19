function [] = plotDFT (signal, handles)
   
    %LOAD SETTINGS
    settings = LoadSettings('Settings.json',handles);
    sampleFreq = get(handles.dataTable, 'sampleFreq');

    showProcessed = get(handles.processedData, 'Value');
    showRaw = get(handles.rawData, 'Value');
	showMath = get(handles.mathData, 'Value');
    enableWindowFunction = get(handles.enableWindowFunction, 'appliedValue');
    enableSmoothing = get(handles.enableSmoothingFunction, 'appliedValue');

    %fprintf('plotting...\n');

    Xp = fft(signal);
    Phi = angle(Xp);
    Mag = mag2db(abs(Xp));

    processedSignal = signal;

    if(enableSmoothing)
        processedSignal = smooth(signal, settings.SmoothingFunction);
    end

    if(enableWindowFunction)
        processedSignal = applyWindowFunction(signal, settings.WindowFunction);
	end

	mathSignal = generateMathChannel(signal, processedSignal, handles);
	
    K = [0:1:length(signal)-1];
    Kprocessed = [0:1:length(processedSignal)-1];


    XpProcessed = fft(processedSignal);
    PhiProcessed = angle(XpProcessed);
    MagProcessed = mag2db(abs(XpProcessed));
	
	XpMath = fft(mathSignal);
	PhiMath = angle(XpMath);
	MagMath = mag2db(abs(XpMath));


    %TIME DOMAIN PLOT
    axes(handles.timeDomainPlot);
    cla;
	hold on;
	
	if showRaw == 1
        plot(K, signal, '-og', 'MarkerEdgeColor', 'Blue', 'MarkerFaceColor','Blue','Color','Blue', 'MarkerSize', 2);
        legend('Raw data');
	end
	
	if showProcessed == 1
        plot(Kprocessed, processedSignal, '-og', 'MarkerEdgeColor', 'Red', 'MarkerFaceColor','Red','Color','Red', 'MarkerSize', 2);
        legend('Processed data');
	end
	
	if showMath == 1
		plot(Kprocessed, mathSignal, '-og', 'MarkerEdgeColor', 'Green', 'MarkerFaceColor','Green','Color','Green', 'MarkerSize', 2);
		legend('Math data');
	end    
		
	if showRaw == 0 && showProcessed == 1 && showMath == 1
        legend('Processed data', 'Math data');
	end
	
	if showRaw == 1 && showProcessed == 0 && showMath == 1
        legend('Raw data', 'Math data');
	end
	
    if showRaw == 1 && showProcessed == 1 && showMath == 0
        legend('Raw data', 'Processed data');
	end
	
	if showRaw == 1 && showProcessed == 1 && showMath == 1
        legend('Raw data', 'Processed data','Math data');
	end
	
    hold off;

    title('Time Domain');
    xlabel('k');
    ylabel('x[k]');
    grid on;

    K = K .* ((2*pi*sampleFreq)/length(K));
    Kprocessed = Kprocessed .* ((2*pi*sampleFreq)/length(Kprocessed));

    %MAGNITUDE PLOT
    axes(handles.frequencyMagnitudePlot);
    cla;
%     if(showRaw == 1)
%         plot(K, Mag, 'o', 'MarkerEdgeColor','Blue', 'MarkerFaceColor','Blue', 'MarkerSize', 2);
%         legend('Raw data');
%         hold on;
%     end
% 
%     if(showProcessed == 1)
%         plot(K, MagProcessed, 'o', 'MarkerEdgeColor','Red', 'MarkerFaceColor','Red', 'MarkerSize', 2);
%         legend('Processed data');
% 	end

	hold on;
	
	if showRaw == 1
        plot(K, Mag, 'og', 'MarkerEdgeColor', 'Blue', 'MarkerFaceColor','Blue','Color','Blue', 'MarkerSize', 2);
        legend('Raw data');
	end
	
	if showProcessed == 1
        plot(Kprocessed, MagProcessed, 'og', 'MarkerEdgeColor', 'Red', 'MarkerFaceColor','Red','Color','Red', 'MarkerSize', 2);
        legend('Processed data');
	end
	
	if showMath == 1
		plot(Kprocessed, MagMath, 'og', 'MarkerEdgeColor', 'Green', 'MarkerFaceColor','Green','Color','Green', 'MarkerSize', 2);
		legend('Math data');
	end

    if showRaw == 0 && showProcessed == 1 && showMath == 1
        legend('Processed data', 'Math data');
	end
	
	if showRaw == 1 && showProcessed == 0 && showMath == 1
        legend('Raw data', 'Math data');
	end
	
    if showRaw == 1 && showProcessed == 1 && showMath == 0
        legend('Raw data', 'Processed data');
	end
	
	if showRaw == 1 && showProcessed == 1 && showMath == 1
        legend('Raw data', 'Processed data','Math data');
	end

    hold off;

    title('Magnitude [dB]');
    xlabel('\omega');
    ylabel('|X_p [k]|');
    grid on;


    %PHASE PLOT
    axes(handles.frequencyPhasePlot);
    cla;
	
	hold on;

%     if(showRaw == 1)
%         plot(K, Phi, 'o', 'MarkerEdgeColor', 'Blue', 'MarkerFaceColor','Blue', 'MarkerSize', 2);
%         hold on;
%         legend('Raw data');
%     end
% 
%     if(showProcessed == 1)
%         plot(K, PhiProcessed, 'o', 'MarkerEdgeColor', 'Red', 'MarkerFaceColor','Red', 'MarkerSize', 2);
%         legend('Processed data');
%     end 

	if showRaw == 1
        plot(K, Phi, 'og', 'MarkerEdgeColor', 'Blue', 'MarkerFaceColor','Blue','Color','Blue', 'MarkerSize', 2);
        legend('Raw data');
	end
	
	if showProcessed == 1
        plot(Kprocessed, PhiProcessed, 'og', 'MarkerEdgeColor', 'Red', 'MarkerFaceColor','Red','Color','Red', 'MarkerSize', 2);
        legend('Processed data');
	end
	
	if showMath == 1
		plot(Kprocessed, PhiMath, 'og', 'MarkerEdgeColor', 'Green', 'MarkerFaceColor','Green','Color','Green', 'MarkerSize', 2);
		legend('Math data');
	end

    hold off;

   if showRaw == 1 && showProcessed == 0 && showMath == 1
        legend('Raw data', 'Math data');
	end
	
    if showRaw == 1 && showProcessed == 1 && showMath == 0
        legend('Raw data', 'Processed data');
	end
	
	if showRaw == 1 && showProcessed == 1 && showMath == 1
        legend('Raw data', 'Processed data','Math data');
	end


    title('Phase[°]');
    xlabel('\omega');
    ylabel('Arg(X_p [k])');
    grid on;

end