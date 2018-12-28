%ENGR 362 TERM DESIGN PROJECT
%PART 2.2 ANALYZING AUDIO
%BY JWAL PRAJAPATI [41193160]

% CREATE A NEW SCRIPT TO ANALYZE THE TUNING FORK AUDIO DATA STORED IN
% "JwalProjectRecorder.m"
% 2.2.1 USE THE SAMPLING FREQUENCY AND # OF POINTS (LENGTH OF TIME VECTOR). 
% 2.2.2 DETERMINE THE FUNDAMENTAL FREQUENCY OF THE FORK BASED ON FREQUENCY DOMAIN
% ANALYSIS, COMPARE WITH ACTUAL FREQUENCY OF THE TUNING FORK. 

close all

% Load(-filename.m) - Tuning fork sample file "320" from Dr.Hossain. 
% Saved as "Sample1"
load('Sample1');

% Defining Sample Properties
NSamp_S=8000;   % Number of samples per second 
NSamp=80000;    % Number of samples taken in 10 seconds (8000 * 10)
NBits=16;       % Number of bits for tuning fork input 
NChannels = 1;  % Number associated with channel used for tuning fork sample
TimeVector = (0:80000-1)*(1/NSamp_S) % Time Vector [formula: (0:L-1)*T 
% where L = Length of signal | T = Sampling period]

% Plotting the tuning fork audio sample (Same as part 2.1)

plot([1:length(myRecording)]/NSamp_S,myRecording);
grid on
xlabel('Time (s)');
ylabel('Amplitude (Hz)');
title('Tuning Fork Audio - Amplitude vs. Time');

% Take the DFT of the audio file
x = fft(myRecording,NSamp); % Dft of the audio file using, fast fourier transform algorithim
xShift = fftshift(x);   % Shifts the DFT output so that F=0 is at the centre

%-------------------------------------------------------------------%
%2.2-2 Fundamental Frequency of the Tuning Fork

% Frequency Axis
f =(-(NSamp-1)/2:(NSamp-1)/2)*NSamp_S/NSamp;


[Max, Freq] = max(abs(xShift/NSamp)); % Max values of the DFT (x & y coordinates)
% Max = Maximum value 
% Freq. = Element withing the Frequency axis 

freqFund = abs(f(Freq)); % Fundamental Freq @ max value
MaxDB = 20*log10(Max); % Maximum Freq in dB

%Find Magnitude and Phase of DFT
XMag = abs(xShift)./NSamp;
XMagDB =20.*log10(XMag);
XPhase = (unwrap(angle(xShift))/NSamp); %UNWRAP SMOOTHS OUT PHASE DIAGRAM

%PLOT MAGNITUDE - DFT OF TUNING FORK NOISE
figure
plot(f,XMagDB);
hold on
grid on
plot(freqFund,MaxDB+1,'r');
plot(1000,-100,'r');
xlabel('Frequency (Hz)');
ylabel('Magnitude of X(f), |X(f)| (dB)');
title('Magnitude Spectrum (DFT), X(f), of Tuning Fork Audio');
hold off

%PLOT PHASE - TUNING FORK DFT
figure
plot(f,XPhase);
grid on
xlabel('Frequency (Hz)');
ylabel('Phase of X(f) (Radians)');
title('Phase Spectrum of the DTF, X(f), of Tuning Fork Audio');

%POWER SPECTRUM CALCULATIONS -r TUNING fork FOR DFT
psdX = (1/NSamp).*(abs(xShift)).^2;
psdXDB = 20*log10(psdX);

%FIND THE FUNDEMENTAL FREQUENCY WITHIN THE POWER SPECTRUM
[pMax,pFreq] = max(psdXDB); 
pFundFreq = abs(f(pFreq));

%PLOT POWER SPECTRUM AND FUNDEMENTAL FREQ
figure
plot(f,psdXDB); % Power Spectrum
hold on
grid on
plot(pFundFreq,pMax,'*r');
xlabel('Frequency (Hz)');
ylabel('Power Spectrum Density of X (dB)');
title('Power Spectrum of the DFT, X(f), of Tuning Fork Audio')