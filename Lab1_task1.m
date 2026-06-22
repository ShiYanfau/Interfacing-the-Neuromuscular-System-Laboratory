%% Task 1 Abduction
% 1.1 Convertion
clear all
close all
load('abduction.otb+.mat','AUX1','EMG','fsamp')
ConversionFactor=100;
Gravity=8.91;
force=((AUX1/ConversionFactor)*Gravity); %force in newtons 

offset=mean(force);
F=force-offset; %force without offset

%1.2 Visualisation
figure(1)
plot(F)
xlabel('Time in seconds')
ylabel('Force in Newtons')
title('Original Force Signal')
grid on;

%1.3 Filtering 
% Applying low pass filter 

%lp_filter = designfilt('lowpassfir','PassbandFrequency',0.45,'StopbandFrequency',0.55,'PassbandRipple',1,'StopbandAttenuation',60,'SampleRate',6);
lp_filter = designfilt('lowpassfir','FilterOrder',20,'CutoffFrequency',0.01,'SampleRate',6); % 采样率为什么是6

FF = filtfilt(lp_filter, F); %filtered force

time = (0:length(F)-1) / fsamp;  % Time vector based on the sampling frequency

figure(2);
plot(time, FF, 'r');  % Filtered signal in red
xlabel('Time in seconds');
ylabel('Force in Newtons');
title('Filtered Force Signal')
grid on;

%1.4 CoV
%calculating the coefficient of variation

CV1_1=((std(FF(round(9.0):round(15.76)))/mean(FF(round(9.0):round(15.76))))*100); 
disp(CV1_1)

CV1_2=((std(FF(round(27.6):round(34.30)))/mean(FF(round(27.6):round(34.30))))*100); 
disp(CV1_2)

CV1_3=((std(FF(round(46.3):round(53.6)))/mean(FF(round(46.3):round(53.6))))*100); 
disp(CV1_3)

CV2_1=((std(FF(round(96.3):round(102.6)))/mean(FF(round(96.3):round(102.6))))*100); 
disp(CV2_1)

CV2_2=((std(FF(round(123.43):round(130.23)))/mean(FF(round(123.43):round(130.23))))*100); 
disp(CV2_2)

CV2_3=((std(FF(round(150.42):round(159.58)))/mean(FF(round(150.42):round(159.58))))*100); 
disp(CV2_3)



%% Task 1 Extension 
clear all
close all
load('extension.otb+.mat','AUX1','EMG','fsamp')
ConversionFactor=0.01;
Gravity=8.91;
force1=((AUX1/ConversionFactor)*Gravity); %force in newtons 

offset1=mean(force1);
F1=force1-offset1; %force without offset

%1.2 Visualisation
figure(3)
plot(F1)
xlabel('Time in seconds')
ylabel('Force in Newtons')
title('Original Force Signal')
grid on;

%1.3 Filtering 
% Applying low pass filter 

%lp_filter = designfilt('lowpassfir','PassbandFrequency',0.45,'StopbandFrequency',0.55,'PassbandRipple',1,'StopbandAttenuation',60,'SampleRate',6);
lp_filter1 = designfilt('lowpassfir','FilterOrder',20,'CutoffFrequency',0.01,'SampleRate',6);

FF1 = filtfilt(lp_filter1, F1); %filtered force

time1 = (0:length(F1)-1) / fsamp;  % Time vector based on the sampling frequency

figure(4);
plot(time1, FF1, 'r');  % Filtered signal in red
xlabel('Time in seconds');
ylabel('Force in Newtons');
title('Filtered Force Signal')
grid on;

%1.4 CoV
%calculating the coefficient of variation

CV3_1=((std(FF1(round(6.94):round(14.56)))/mean(FF1(round(6.94):round(14.56))))*100); 
disp(CV3_1)

CV3_2=((std(FF1(round(27.94):round(33.10)))/mean(FF1(round(27.94):round(33.10))))*100); 
disp(CV3_2)

CV3_3=((std(FF1(round(46.74):round(53.00)))/mean(FF1(round(46.74):round(53.00))))*100); 
disp(CV3_3)

CV4_1=((std(FF1(round(90.90):round(98.28)))/mean(FF1(round(90.90):round(98.28))))*100); 
disp(CV4_1)

CV4_2=((std(FF1(round(118.32):round(125.34)))/mean(FF1(round(118.32):round(125.34))))*100); 
disp(CV4_2)

CV4_3=((std(FF1(round(145.83):round(152.97)))/mean(FF1(round(145.83):round(152.97))))*100); 
disp(CV4_3)

%% Task 1 Flextion
clear all
close all
load('flextion.otb+.mat','AUX1','EMG','fsamp')
ConversionFactor=100;
Gravity=8.91;
force2=((AUX1/ConversionFactor)*Gravity); %force in newtons 

offset2=mean(force2);
F2=force2-offset2; %force without offset

%1.2 Visualisation
figure(5)
plot(F2)
xlabel('Time in seconds')
ylabel('Force in Newtons')
title('Original Force Signal')
grid on;

%1.3 Filtering 
% Applying low pass filter 

%lp_filter = designfilt('lowpassfir','PassbandFrequency',0.45,'StopbandFrequency',0.55,'PassbandRipple',1,'StopbandAttenuation',60,'SampleRate',6);
lp_filter2 = designfilt('lowpassfir','FilterOrder',20,'CutoffFrequency',0.01,'SampleRate',6);

FF2 = filtfilt(lp_filter2, F2); %filtered force

time2 = (0:length(F2)-1) / fsamp;  % Time vector based on the sampling frequency

figure(6);
plot(time2, FF2, 'r');  % Filtered signal in red
xlabel('Time in seconds');
ylabel('Force in Newtons');
title('Filtered Force Signal')
grid on;

%1.4 CoV
%calculating the coefficient of variation
CV5_1=((std(FF2(round(11.14):round(16.44)))/mean(FF2(round(11.14):round(16.44))))*100); 
disp(CV5_1)

CV5_2=((std(FF2(round(30.09):round(35.85)))/mean(FF2(round(30.09):round(35.85))))*100); 
disp(CV5_2)

CV5_3=((std(FF2(round(49.50):round(53.80)))/mean(FF2(round(49.50):round(53.80))))*100); 
disp(CV5_3)

CV6_1=((std(FF2(round(87.04):round(93.78)))/mean(FF2(round(87.04):round(93.78))))*100); 
disp(CV6_1)

CV6_2=((std(FF2(round(115.42):round(121.039)))/mean(FF2(round(115.42):round(121.039))))*100); 
disp(CV6_2)

CV6_3=((std(FF2(round(141.85):round(148.36)))/mean(FF2(round(141.85):round(148.36))))*100); 
disp(CV6_3)




