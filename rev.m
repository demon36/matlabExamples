[signal,sampleRate,numSamples] = wavread('test.wav');
sound(signal,sampleRate);



figure; subplot(2,1,1); plot(signal); ylim([-1 2]); xlabel('Samples','fontsize',7);

Y = fft(signal);
Y = abs(Y(1:floor(length(Y)/2)));
F = linspace(0,sampleRate/2,length(Y))';
subplot(2,1,2);
semilogy(F,Y); ylabel('dB'); xlabel('Frequency','fontsize',7); xlim([0 sampleRate/2]);
saveas(gcf,[person '-glottalpulse'],'png');
  

% Using windows function
w = hanning(numSamples); 
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


