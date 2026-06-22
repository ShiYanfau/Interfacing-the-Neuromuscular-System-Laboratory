%% Task 3.1
%% for Abduction_MUs
clear all
close all
load ("Abduction_MU.mat",'MUPulses','ref_signal')
addpath '/Users/piro/Documents/Lab 1/plotSpikeRaster_v1.2'
%Spike Trains
spikeTrains=zeros(size(MUPulses,2),size(ref_signal,2));
for motorUnits=1:size(spikeTrains,1)
    spikeTrains(motorUnits,MUPulses{motorUnits})=1;
end
spikeTrains=logical(spikeTrains);

figure(1)
plotSpikeRaster(spikeTrains,'PlotType','vertline','VertSpikeHeight',0.9)
xlabel("Samples")
ylabel("MUs")
title("Spike Trains for Abduction_ MU")

ConversionFactor=100;
Gravity=8.91;
force=((ref_signal/ConversionFactor)*Gravity);

yyaxis right
plot(force)
ylabel("Force in Newtons")



%% for Extension_MUs
clear all
close all
load ("Extention_MU.mat",'MUPulses','ref_signal')
addpath '/Users/piro/Documents/Lab 1/plotSpikeRaster_v1.2'
%Spike Trains
spikeTrains=zeros(size(MUPulses,2),size(ref_signal,2));
for motorUnits=1:size(spikeTrains,1)
    spikeTrains(motorUnits,MUPulses{motorUnits})=1;
end
spikeTrains=logical(spikeTrains);

figure(2)
plotSpikeRaster(spikeTrains,'PlotType','vertline','VertSpikeHeight',0.9)
xlabel("Samples")
ylabel("MUs")
title("Spike Trains for Extension_ MU")

ConversionFactor=100;
Gravity=8.91;
force=((ref_signal/ConversionFactor)*Gravity);

yyaxis right
plot(force)
ylabel("Force in Newtons")

%% for Flexion_MUs
clear all
close all
load ("Flexion_MU.mat",'MUPulses','ref_signal')
addpath '/Users/piro/Documents/Lab 1/plotSpikeRaster_v1.2'
%Spike Trains
spikeTrains=zeros(size(MUPulses,2),size(ref_signal,2));
for motorUnits=1:size(spikeTrains,1)
    spikeTrains(motorUnits,MUPulses{motorUnits})=1;
end
spikeTrains=logical(spikeTrains);

figure(3)
plotSpikeRaster(spikeTrains,'PlotType','vertline','VertSpikeHeight',0.9)
xlabel("Samples")
ylabel("MUs")
title("Spike Trains for Flexion_ MU")

ConversionFactor=100;
Gravity=8.91;
force=((ref_signal/ConversionFactor)*Gravity);

yyaxis right
plot(force)
ylabel("Force in Newtons")

%% Task 3.3 
%% for Abduction_MU
clear all
close all
load ("Abduction_MU.mat",'MUPulses','ref_signal','SIG','fsamp','IED')
%let's define window size 
win=0.03; %window size 30ms
STA_win=round(win*fsamp);
for num = 1:size(MUPulses,2)
  
    for r = 1:size(SIG,1) %rows
        for c= 1:size(SIG,2) %columns
            if ~isempty(SIG{r,c})
                for spks = 1:size(MUPulses{num},2)
                    if MUPulses{num}(spks)+STA_win < length(SIG{r,c}) && MUPulses{num}(spks)-STA_win>=1
                        temp_STA(spks,:) = SIG{r,c}(MUPulses{num}(spks)-STA_win:MUPulses{num}(spks)+STA_win);
                    end
                end
                mean_STA{num}{r,c} =mean(temp_STA,1);
          
            end
        end
    end
end

%% Plot 
for num = 1:size(MUPulses, 2)
    figure(4)
    x = 1;
   
    for EMG_r = 1:size(SIG, 1)
        % Finding the channel with the highest peak-to-peak value for the current motor unit
        highestPeakToPeak = -inf;
        highestChannelIndex = 0;
        for EMG_c = 1:size(SIG, 2)
            if ~isempty(SIG{EMG_r, EMG_c})
                peakToPeak = max(SIG{EMG_r, EMG_c}) - min(SIG{EMG_r, EMG_c});
                if peakToPeak > highestPeakToPeak
                    highestPeakToPeak = peakToPeak;
                    highestChannelIndex = EMG_c;
                end
            end
        end
        
        if highestChannelIndex > 0
            % Plotting the MUAP shape of the channel with the highest peak-to-peak value
            plot(mean_STA{num}{EMG_r, highestChannelIndex}, 'color', 'k')
            title("Highest peak-to-peak MUAP value for Abduction_ MU")
            hold on
            x = x + 1;
        end
    end
end 

hold off    

%% for Extension_MU
clear all
close all
load ("Extention_MU.mat",'MUPulses','ref_signal','SIG','fsamp','IED')
%let's define window size 
win=0.03; %window size 30ms
STA_win=round(win*fsamp);
for num = 1:size(MUPulses,2)
  
    for r = 1:size(SIG,1) %rows
        for c= 1:size(SIG,2) %columns
            if ~isempty(SIG{r,c})
                for spks = 1:size(MUPulses{num},2)
                    if MUPulses{num}(spks)+STA_win < length(SIG{r,c}) && MUPulses{num}(spks)-STA_win>=1
                        temp_STA(spks,:) = SIG{r,c}(MUPulses{num}(spks)-STA_win:MUPulses{num}(spks)+STA_win);
                    end
                end
                mean_STA{num}{r,c} =mean(temp_STA,1);
          
            end
        end
    end
end

%% Plot 
for num = 1:size(MUPulses, 2)
    figure(5)
    x = 1;
   
    for EMG_r = 1:size(SIG, 1)
        % Finding the channel with the highest peak-to-peak value for the current motor unit
        highestPeakToPeak = -inf;
        highestChannelIndex = 0;
        for EMG_c = 1:size(SIG, 2)
            if ~isempty(SIG{EMG_r, EMG_c})
                peakToPeak = max(SIG{EMG_r, EMG_c}) - min(SIG{EMG_r, EMG_c});
                if peakToPeak > highestPeakToPeak
                    highestPeakToPeak = peakToPeak;
                    highestChannelIndex = EMG_c;
                end
            end
        end
        
        if highestChannelIndex > 0
            % Plotting the MUAP shape of the channel with the highest peak-to-peak value
            plot(mean_STA{num}{EMG_r, highestChannelIndex}, 'color', 'b')
            title("Highest peak-to-peak MUAP value for Extension_ MU")
            hold on
            x = x + 1;
        end
    end
end 

hold off    

%% for Flexion_MU
clear all
close all
load ("Flexion_MU.mat",'MUPulses','ref_signal','SIG','fsamp','IED')
%let's define window size 
win=0.03; %window size 30ms
STA_win=round(win*fsamp);
for num = 1:size(MUPulses,2)
  
    for r = 1:size(SIG,1) %rows
        for c= 1:size(SIG,2) %columns
            if ~isempty(SIG{r,c})
                for spks = 1:size(MUPulses{num},2)
                    if MUPulses{num}(spks)+STA_win < length(SIG{r,c}) && MUPulses{num}(spks)-STA_win>=1
                        temp_STA(spks,:) = SIG{r,c}(MUPulses{num}(spks)-STA_win:MUPulses{num}(spks)+STA_win);
                    end
                end
                mean_STA{num}{r,c} =mean(temp_STA,1);
          
            end
        end
    end
end

%% Plot 
for num = 1:size(MUPulses, 2)
    figure(6)
    x = 1;
   
    for EMG_r = 1:size(SIG, 1)
        % Finding the channel with the highest peak-to-peak value for the current motor unit
        highestPeakToPeak = -inf;
        highestChannelIndex = 0;
        for EMG_c = 1:size(SIG, 2)
            if ~isempty(SIG{EMG_r, EMG_c})
                peakToPeak = max(SIG{EMG_r, EMG_c}) - min(SIG{EMG_r, EMG_c});
                if peakToPeak > highestPeakToPeak
                    highestPeakToPeak = peakToPeak;
                    highestChannelIndex = EMG_c;
                end
            end
        end
        
        if highestChannelIndex > 0
            % Plotting the MUAP shape of the channel with the highest peak-to-peak value
            plot(mean_STA{num}{EMG_r, highestChannelIndex}, 'color', 'g')
            title("Highest peak-to-peak MUAP value for Flexion_ MU")
            hold on
            x = x + 1;
        end
    end
end 

hold off    

