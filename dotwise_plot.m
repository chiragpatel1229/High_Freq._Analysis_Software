% polar plot assuming single incomin datapoints

load yagi.mat

yagi_deg=yagi_deg/180*pi;               % deg in radians

figure

polarplot(yagi_deg(1),yagi_pow(1))      % just  to initiate hold on

hold on

rlim([-75 -54]) % norm r-axis    How to choose these values??
for k=2: length(yagi_deg)
 polarplot([yagi_deg(k-1),yagi_deg(k)],[yagi_pow(k-1),yagi_pow(k)],'-o') % connect 2 subsequent points
 pause(0.1)                                                                        % previous and current   
end
polarplot([yagi_deg(1),yagi_deg(k)],[yagi_pow(1),yagi_pow(k)],'-o')     % connect first and last sample (useful only for 360°)
hold off