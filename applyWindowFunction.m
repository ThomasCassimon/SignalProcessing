function [result] = applyWindowFunction(signal,windowFunction)
%function that applies the correct window function to a signal. The window
%function is determined from the input string 'window'.

%DETERMINE WINDOW FUNCTION
   switch windowFunction
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
   
   result = signal .* window;

end

