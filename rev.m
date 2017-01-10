[signal,sampleRate,numSamples] = wavread('test.wav');
sound(signal,sampleRate);

%Y = fft(signal);


% Using windows function
M = length(signal); 
w = hanning(M); 
yw = w'.*signal; 

% %without window
% yw = y;

% Next power of 2 from length of y
NFFT = 2^nextpow2(length(yw)); 
Y = fft(yw,NFFT);

% Calculate the numberof unique points 
NumUniquePts = ceil((NFFT+1)/2);
 
% Creating the frequency vector
f = (0:NumUniquePts-1)*Fs/NFFT;

% Throwing away the second half
Y = Y(1:NumUniquePts);

% Calculate the magnitude
my = 2*(abs(Y)/length(yw)); 

% Obtaining the magnitude and frequency
[maxpos,i] = max(my);
F = f(i);



plot(Y,P1);
title('Single-Sided Amplitude Spectrum of S(t)');
xlabel('f (Hz)');
ylabel('|P1(f)|');