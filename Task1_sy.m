clear all
close all
load('abduction.otb+.mat','AUX1','EMG','fsamp')

% task 1.1
ConversionFactor = 100;
Gravity = 9.81;
force_inN = AUX1 * Gravity / ConversionFactor;

% task 1.2
offset = mean(force_inN);
F=force_inN-offset;

figure(1)
plot(F)
xlabel('Time in seconds')
ylabel('Force in Newtons')
title('Original Force Signal')
grid on;

%task 1.3
lp_filter = designfilt('lowpassfir','FilterOrder',20,'CutoffFrequency',0.01,'SampleRate',6);
F_filter = filter(lp_filter,F);
t = (0:length(F)-1)/fsamp;

figure(2)
plot(t,F_filter)
grid on;

%task 1.4
cov1_1 = std(F_filter(9*fsamp:15*fsamp))/mean(F_filter(9*fsamp:15*fsamp))

%task 2.1 
emgData = transpose(EMG);

figure();
for channel = 1:size(emgData, 2)
    subplot(size(emgData, 2), 1, channel);
    plot(emgData(:, channel));
    title(sprintf('Channel %d', channel));
end


% 使用陷波滤波器或带阻滤波器对所有EMG通道进行滤波
notchFrequency = 50; % 陷波滤波器的中心频率（50 Hz）
filterOrder = 10; % 滤波器的阶数


% 创建陷波滤波器对象
notchFilter = designfilt('bandstopiir','FilterOrder',filterOrder,'HalfPowerFrequency1',notchFrequency-1,'HalfPowerFrequency2',notchFrequency+1,'SampleRate',fsamp);

% 对所有EMG通道进行滤波
filteredData = zeros(size(emgData));
for channel = 1:size(emgData, 2)
    filteredData(:, channel) = filtfilt(notchFilter, emgData(:, channel));
end

% 绘制示例通道的功率谱图（滤波前后对比）
exampleChannel = 1; % 选择示例通道的索引

% 计算滤波前的功率谱
figure;
subplot(2,1,1);
[powerSpectrumBefore, frequency] = pwelch(emgData(:, exampleChannel), [], [], [], fsamp);
plot(frequency, 10*log10(powerSpectrumBefore));
title('Power Spectrum (Before Filtering)');
xlabel('Frequency (Hz)');
ylabel('Power (dB)');

% 计算滤波后的功率谱
subplot(2,1,2);
[powerSpectrumAfter, ~] = pwelch(filteredData(:, exampleChannel), [], [], [], fsamp);
plot(frequency, 10*log10(powerSpectrumAfter));
title('Power Spectrum (After Filtering)');
xlabel('Frequency (Hz)');
ylabel('Power (dB)');

%task 2.2
% 计算所有64个通道上的平均EMG
averageEMG = mean(emgData, 2)'; % 计算每个样本的平均值，并转置为1 x samples的数组

% 4.2. 计算平均EMG的RMS，使用200毫秒的移动窗口
windowLength = round(0.2 * fsamp); % 200毫秒对应的样本数
rmsEMG=sqrt(movmean(emgData.^2,windowLength,2));% 计算RMS，得到1 x samples的数组

% 可视化RMS结果
time = (0:length(rmsEMG)-1) / fsamp; % 计算时间轴
figure;
plot(time, rmsEMG);
title('RMS of Average EMG');
xlabel('Time (s)');
ylabel('RMS');

% 4.3. 可视化RMS和力信号之间的相关性
normalizedRMS = (rmsEMG - min(rmsEMG)) / (max(rmsEMG) - min(rmsEMG)); % 归一化RMS
normalizedForce = (AUX1 - min(AUX1)) / (max(AUX1) - min(AUX1)); % 归一化力信号

figure;
scatter(normalizedRMS, normalizedForce); %创建散点图
title('Correlation between Normalized RMS and Normalized Force');
xlabel('Normalized RMS');
ylabel('Normalized Force');

% 计算相关系数R
R = corr(normalizedRMS, normalizedForce);
fprintf('Correlation coefficient R: %.4f\n', R);

% task 3.1















