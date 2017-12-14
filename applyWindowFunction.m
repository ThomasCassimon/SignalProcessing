function [result] = applyWindowFunction(signal,windowFunction)
%function that applies the correct window function to a signal. The window
%function is determined from the input string 'window'.

%DETERMINE WINDOW FUNCTION
   switch windowFunction
       case "Rectangle Window"
           window = rectwin(length(signal));
           fprintf('Rectangle Window\n');
       case "Bartlett Window"
           window = bartlett(length(signal));
           fprintf('Bartlett Window\n');
       case "Hann Window"
           window = hann(length(signal));
           fprintf('Hann Window\n');
       case "Hamming Window"
           window = hamming(length(signal));
           fprintf('Hamming Window\n');
       case "Blackman Window"
           window = blackman(length(signal));
           fprintf('Blackman Window\n');
       case "Flat Top Window"
           window = flattopwin(length(signal));
           fprintf('Flat Top Window\n');
       otherwise
           fprintf('Wrong window function argument\n');   
   end
   
   result = signal .* window;

end

