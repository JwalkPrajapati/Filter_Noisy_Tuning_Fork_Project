%ENGR 362 TERM DESIGN PROJECT
%PART 2.2 ANALIZING TURNING FORK AUDIO
%BY NICO VOLPE 18367145

%REFRESH PROGRAM
close all
%CLEAR ALL;

% Create a new script or function to analyze the tuning fork audio data.
% 1. Make a calibrated frequency scale to use for plotting the DFT. Use the sample frequency
% and number of points N (length of the time vector) to create this vector.
% 2. What is the fundamental frequency of the tuning fork based on your frequency domain
% analysis? How close is this frequency relative the frequency which was stamped on the
% tuning fork

%LOAD FILE
whos('-file','sample(1)');
load('sample(1)');

%PLOT THE AUDIO SAMPLE A