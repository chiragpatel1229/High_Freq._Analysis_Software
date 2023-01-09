a = readtable('yagi.xlsx');
% b = readtable('Yagi.xlsx');

x=  table2array(a(2:end,2));
y=  - (table2array(a(2:end,3)));

% e=  table2array(b(:,2));
% f= - table2array(b(:,3));

x1 = deg2rad(x);

% e1 = deg2rad(e);

figure(1)
polarplot(x1, y)

% figure(2)  
% hold on
% polarplot(e1, f)
% hold off
% 
% 
% 
% %% ...
% %2021a model does not require any specific data type for the polar diagram 
% % BUT 2022b does need to have a specific datatype.
% % smaple code rushabh na email ma che \ 

% Set up the polar plot
% h = polarplot(0,0);

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
% n = 1;
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



% closing request for app designer

            selection = uiconfirm(app.AntennaTestbedUIFigure,...
                ["Closing App?";"Please reset and disconnect EXA & MXG."],...
                'Confirm Close', 'Options',{'Disconnect EXA & MXG','OK','Cancel'});
            switch selection
                case 'OK'
                    delete(app)
                case 'Disconnect EXA & MXG'
                    app.obj1.Disconnect_Generator();
                    app.obj.Disconnect_Analyzer();
                case 'Cancel'
                    return
            end
        end