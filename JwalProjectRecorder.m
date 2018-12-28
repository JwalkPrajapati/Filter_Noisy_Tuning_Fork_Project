% ENGR 362 TERM PROJECT 
% 2.1 CAPTURE AUDIO
% JWAL PRAJAPATI [41193160]

% 2.1.1 CAPTURE A 10 SECOND DISCRETE TIME SIGNAL FOR A TUNING FORK. 
    % TUNING FORK SAMPLE FILE "320" WAS USED.
    % CONFIGURATION:
        % SAMPLE RATE - 8 KHZ
        % # OF BITS - 16 BITS 
        % ONE CHANNEL IS USED
    % FIND THE INPUT/OUTPUT DEVICE DEFAULT NUMBERS USING "AUDIODEVINFO"
    
% 2.1.2 SAVE THE FILE AS A ".MAT" FILE FOR FURTHER PROCESSING, SAVE SAMPLE
% RATE(FS) AND OTHER VARIABLES/ ENSURE THE VARIABLES ARE APPENDED TO THE
% FILE. 

clear all
close all

 % Obtain sound device informations
 devinfo = audiodevinfo;

 % set the input and output device we will use in the code
 inputdev = devinfo.input(1).ID;
 outputdev = devinfo.output(1).ID;

 % Set the sample rate, #-of bits and channels for the recording
 Fs = 8000; % Convert 8KHz to Hz
 Nbits = 16;
 NChannels = 1;

 % create the recorder object. We will use this object to record our sound,
 % the input variables are also stored in this object
 recObj = audiorecorder(Fs,Nbits,NChannels,inputdev);

% Setting the duration of the recording to be 10 seconds, and saving the
% signal values of the recording
 recordTime = 10; % Time interval the recording takes place
 disp('Start Recording');
 recordblocking(recObj, recordTime); % recordblocking(recorder,length)
 disp('Finish Recording');

 % grabs the audio data from our recorded sound and creates an array that 
 % stores it into a variable
 myRecording = getaudiodata(recObj);

 plot([1:length(myRecording)]/Fs,myRecording); % Plots the recorded signal 
 % values from 1 to the length of the recorded signals (as a function of
 % time)
 xlabel('Time (s)')
 ylabel('Amplitude (Hz)')

 % Playing the audio again witht the initial variables. 
 playObj = audioplayer(myRecording,Fs,Nbits,outputdev);
     play(playObj);

 % This will store our current workspace (e.g. all variables) so I can work
 % on it later
 save('myRecording')