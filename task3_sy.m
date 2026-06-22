clear all
close all
addpath plotSpikeRaster
load ("Abduction_MU.mat",'SIG','MUPulses','ref_signal','discardChannelsVec','fsamp','SIGlength')


% task 3.1：绘制MU动作电位放电时序（脉冲火车图）


% 转换SIG和MUPulses的数据类型为逻辑型

SIG_logical = cell(size(SIG));
for i = 1:numel(SIG)
    SIG_logical{i} = logical(SIG{i});
end

MUPulses_logical = cell(size(MUPulses));
for i = 1:numel(MUPulses)
    MUPulses_logical{i} = logical(MUPulses{i});
end


% 创建图形窗口
figure;
hold on;

% 绘制MU动作电位放电时序
for i = 1:size(MUPulses, 2)  % i是1-6
    subplot(size(MUPulses, 2), 1, i);
    plotSpikeRaster(MUPulses_logical{i}, 'PlotType', 'vertline', 'VertSpikeHeight', 0.9);
    title(['MU' num2str(i) ' Spike Train']);
    xlabel('Sample');
    ylabel('Action Potential');
end

% 设置整体图形标题和调整布局

hold off;




% task 3.2
% 选择在两个力水平下均有激活的运动单位 not sure how to choose that
MUPulses_lower = MUPulses(1);
MUPulses_higher = MUPulses(2);

plateauPhaseDuration_lower = 5;
plateauPhaseDuration_higher = 5; % Tentatively set to 5



activeMotorUnits = find(~cellfun(@isempty, MUPulses_lower) & ~cellfun(@isempty, MUPulses_higher));

% 初始化数组以存储发放率
firingRates_lower = zeros(1, numel(activeMotorUnits));
firingRates_higher = zeros(1, numel(activeMotorUnits));


% 计算在平台阶段的发放率
for i = 1:numel(activeMotorUnits)  % numel（）计算元素总数
    MU_index = activeMotorUnits(i);
    
    % 低力水平下的发放率
    firingRates_lower(i) = numel(MUPulses_lower{MU_index}) / plateauPhaseDuration_lower;
    
    % 高力水平下的发放率
    firingRates_higher(i) = numel(MUPulses_higher{MU_index}) / plateauPhaseDuration_higher;
end

% 计算平均发放率
avgFiringRate_lower = mean(firingRates_lower);
avgFiringRate_higher = mean(firingRates_higher);

% 可视化结果
figure;
bar([avgFiringRate_lower, avgFiringRate_higher]);
xlabel('力水平');
ylabel('average firing rates');
xticks([1, 2]);
xticklabels({'lower', 'high'});
title('average rates compare');

% 报告结果
fprintf('低力水平下的平均发放率：%.2f Hz\n', avgFiringRate_lower);
fprintf('高力水平下的平均发放率：%.2f Hz\n', avgFiringRate_higher);


%task 3.3


