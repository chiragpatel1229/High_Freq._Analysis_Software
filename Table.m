[filenames,pathname] = uigetfile('*.xlsx','Select the files','MultiSelect','on');

num_files = length(filenames)

if num_files < 2
    L = imread("icons8-lol-64.png");
    msgbox(["You have selected only one file!!";...
        "Please select more than 1 file."],...
        "Error","custom",L);  
% else    
%     for i = 1:num_files
%         currentData = readtable(fullfile(pathname,filenames{i}),'VariableNamingRule','preserve');
%         eval([ 'file_' num2str(i) '=currentData;' ])
%     end
% 
end
% 
% % a = readtable('yagi_180.xlsx');
% % 
% x=  table2array(file_1(:,2));
% y=  table2array(file_1(:,3));
% % 
% x1 = deg2rad(x);
% 
% 
% polarpattern(x, y, 'TitleTop','Yagi Antenna.','AngleAtTop',0, 'AngleDirection','cw','MagnitudeAxisAngle',90);
% 
% % b = readtable('Yagi.xlsx');
% e=  table2array(file_2(:,2));
% f=  table2array(file_2(:,3));
%  
% hold on
% polarpattern(e, f);
% hold off
% % % 
% 


% suggesting the valid number for the stepsize

% Step_size = input('Enter a value for step size: ');
% 
% if mod(Step_size, 360) ~= 0
%     new_Step_size = round(Step_size);
%     if mod(new_Step_size, 360) ~= 0
%         new_Step_size = new_Step_size - 1;
%     end
%     fprintf('The value %.1f is not divisible by 360. Suggested value: %d\n', Step_size, new_Step_size);
% else
%     fprintf('The value %.1f is divisible by 360\n', Step_size);
% end







                
                
% %                 x =  table2array(T(:,2));
% %                 y =  table2array(T(:,3));
% %                 x1 = deg2rad(x);
% %                 
%                 
%                 
%                 R_Step = deg2rad(Step_Size); % current motor angle converted to radian 
%                 
%                 polarplot(R_Step,100 + (Power), "");     %  polar plot 
%                 
%                 
%                 
% %                 polarplot(x1, y);
%                 L = gca;
%                 angles = 0:20:360;
%                 L.ThetaTick = angles;
%                 L.ThetaDir = 'clockwise';
%                 L.RTickMode = 'auto';
%                 L.ThetaZeroLocation = 'top';
%                 hold on

%                 drawnow update



% 
% %% ...
% %2021a model does not require any specific data type for the polar diagram 
% % BUT 2022b does need to have a specific datatype.
% % smaple code rushabh na email ma che \ 

% % Set up the polar plot
% h = polarplot(0,0);
% 
% % Set the axis limits and label properties
% rlim([0 1]);
% rtickformat('%d%%');
% thetalim([0 360]);
% thetaticks(0:45:360);
% thetatickformat('%d^o');
% 
% % Set the starting angle and radius
% angle = 15;
% radius = 56;
% 
% % Set the loop counter
% n = 0.5;
% 
% % Start the loop
% while n <= 100
%     % Update the angle and radius
%     angle = angle + 3;
%     radius = sin(n/10);
%     
%     % Update the polar plot data
% %     h.RData = radius;
% %     h.ThetaData = angle;
%      polarplot(radius,angle)
%     
%     % Refresh the plot
%     drawnow
%     
%     % Increment the loop counter
%     n = n + 1;
% end
% 
% 


% 
% N = 10000;
% phi = linspace(0, 2 * pi, N);
% u1 = 3;
% figure   % to create a new fig. for every execution
% % grid on  % it is not necessary for the polar plot 
% h = animatedline; % important for the animation 
% M = 1e3;
% varphic = linspace(0, 2 * pi, M);
% for i = 1 : M
%     z = cos(u1 .* phi + varphic(1, i));
%     h = polarplot(phi,z);
% %     clearpoints(h);
% %     addpoints(h, phi, z);
%     drawnow update
% end
