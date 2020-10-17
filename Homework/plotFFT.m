
% Clear figures
clf;

% Enter your file here -- make sure
% you have the wav file and plotFFT.m in the same folder!
%
% Read in the wav file -- y stores the amplitudes, and Fs is the sampling
% frequency (1/Fs = delta_t)
[y,Fs] = audioread('cicada.wav');

% The total number of samples
Nsamps = length(y);

% Create a time vector based on the total number of samples with a spacing
% based on the sampling frequency used to create the wav file (ex. with Fs
% = 100 Hz, t = [0 0.01 0.02 0.03 ...]
t = (1/Fs)*(0:Nsamps-1);

% Calculate the fast fourier transform (FFT) of the audio signal. This
% command keeps the magnitude only (using the abs command) and ignores
% phase for now
y_fft = fft(y);
y_fft_mag = abs(y_fft)./(length(y)/2);

% Due to the math, the fft 
% actually reflects itself, so we'll only keep the first half of points 
% (the second half is redundant)
y_fft_mag = y_fft_mag(1:Nsamps/2);

% Create a frequency vector up to the frequency Fs/2
f = Fs*(0:Nsamps/2-1)/Nsamps;

% Plot time and frequency plots together
subplot(2,1,1); plot(t,y); xlabel('Time (sec)'); ylabel('Amplitude'); title('Time domain'); grid on; set(gca, 'FontSize', 14);
subplot(2,1,2); plot(f,y_fft_mag); xlabel('Frequency (Hz)'); ylabel('Amplitude'); title('Frequency domain'); grid on; set(gca, 'FontSize', 14);
% only plot frequency up to 5 kHz so easier to see than full 20 kHz
xlim([0 5000]); 

