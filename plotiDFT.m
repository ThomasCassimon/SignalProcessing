function [] = plotiDFT (dft)
    x = ifft(dft);

	Phi = phase(dft) * 2 * pi;
	Mag = mag2db(abs(dft));

	subplot(3,1,1);
	plot([0:1:length(x) - 1], x, '-og', 'MarkerEdgeColor', 'Green', 'MarkerFaceColor','Green');
	title('Original Signal');
	xlabel('n');
	ylabel('x[n]');
	grid on;
	subplot(3,1,2);
	plot([0:1:length(dft) - 1], Mag, 'o', 'MarkerEdgeColor', 'Blue', 'MarkerFaceColor','Blue');
	title('Magnitude [dB]');
	xlabel('n');
	ylabel('|X_p [n]|');
	grid on;
	subplot(3,1,3);
	plot([0:1:length(dft) - 1], Phi, 'o', 'MarkerEdgeColor', 'Red', 'MarkerFaceColor','Red');
	title('Phase [�]');
	xlabel('n');
	ylabel('Arg(X_p [n])');
	grid on;
end