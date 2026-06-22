%% task 2.2 
%% Flextion
clear all
close all
load('flextion.otb+.mat','AUX1','EMG','fsamp')
ConversionFactor = 100;
Gravity = 8.91;

force = ((AUX1/ConversionFactor) * Gravity); %force in newtons 

offset = mean(force);
F = force - offset; %force without offset
lp_filter = designfilt('lowpassfir','FilterOrder',20,'CutoffFrequency',0.01,'SampleRate',6);

FF = filtfilt(lp_filter, F); %filtered force

time = (0:length(F)-1) / fsamp;  % Time vector based on the sampling frequency

time_win=0.2;
w1 = round(time_win*fsamp); 
RMS=sqrt(movmean(EMG.^2,w1,2));
SIG=linspace(0,size(FF,2)/fsamp,size(FF,2));
i=1:w1:length(EMG)-w1;

for j=1:size(i,2)
    NORM_RMS(j)=rms(EMG(i(j):i(j)+w1));
    EMG_avg(j)=abs(mean(EMG(i(j):i(j)+w1)));
    F_1(j)=mean(F(i(j):i(j)+w1));

end

figure(1)
plot(SIG,EMG)
hold on
plot(SIG,RMS,'LineWidth',2)
xlabel('Time in seconds)')


figure(2)
plot(NORM_RMS)
yyaxis right
plot(F_1)
xlabel('Normalized RMS')
ylabel('Force Signal')

R=corrcoef(NORM_RMS,F_1);
disp("Correlation Coefficient R - flextion  " +num2str(R(1,2)))


%% Abduction 
clear all
close all
load('abduction.otb+.mat','AUX1','EMG','fsamp')
ConversionFactor = 100;
Gravity = 8.91;

force = ((AUX1/ConversionFactor) * Gravity); %force in newtons 

offset = mean(force);
F = force - offset; %force without offset
lp_filter = designfilt('lowpassfir','FilterOrder',20,'CutoffFrequency',0.01,'SampleRate',6);

FF = filtfilt(lp_filter, F); %filtered force

time = (0:length(F)-1) / fsamp;  % Time vector based on the sampling frequency

time_win=0.2;
w1 = round(time_win*fsamp);
RMS=sqrt(movmean(EMG.^2,w1,2));
SIG=linspace(0,size(FF,2)/fsamp,size(FF,2));
i=1:w1:length(EMG)-w1;

for j=1:size(i,2)
    NORM_RMS(j)=rms(EMG(i(j):i(j)+w1));
    EMG_avg(j)=abs(mean(EMG(i(j):i(j)+w1)));
    F_1(j)=mean(F(i(j):i(j)+w1));

end

figure(3)
plot(SIG,EMG)
hold on
plot(SIG,RMS,'LineWidth',2)
xlabel('Time in seconds)')


figure(4)
plot(NORM_RMS)
yyaxis right
plot(F_1)
xlabel('Normalized RMS')
ylabel('Force Signal')

R=corrcoef(NORM_RMS,F_1);
disp("Correlation Coefficient R - abduction " +num2str(R(1,2)))

%% Extension
clear all
close all
load('extension.otb+.mat','AUX1','EMG','fsamp')
ConversionFactor = 100;
Gravity = 8.91;

force = ((AUX1/ConversionFactor) * Gravity); %force in newtons 

offset = mean(force);
F = force - offset; %force without offset
lp_filter = designfilt('lowpassfir','FilterOrder',20,'CutoffFrequency',0.01,'SampleRate',6);

FF = filtfilt(lp_filter, F); %filtered force

time = (0:length(F)-1) / fsamp;  % Time vector based on the sampling frequency

time_win=0.2;
w1 = round(time_win*fsamp);
RMS=sqrt(movmean(EMG.^2,w1,2));
SIG=linspace(0,size(FF,2)/fsamp,size(FF,2));
i=1:w1:length(EMG)-w1;

for j=1:size(i,2)
    NORM_RMS(j)=rms(EMG(i(j):i(j)+w1));
    EMG_avg(j)=abs(mean(EMG(i(j):i(j)+w1)));
    F_1(j)=mean(F(i(j):i(j)+w1));

end

figure(3)
plot(SIG,EMG)
hold on
plot(SIG,RMS,'LineWidth',2)
xlabel('Time in seconds)')


figure(4)
plot(NORM_RMS)
yyaxis right
plot(F_1)
xlabel('Normalized RMS')
ylabel('Force Signal')

R=corrcoef(NORM_RMS,F_1);
disp("Correlation Coefficient R - extension " +num2str(R(1,2)))


