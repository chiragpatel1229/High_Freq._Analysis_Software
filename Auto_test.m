

% function T = Auto_test(range, resolution, seconds)
%             app.obj = Analyzer_EXA_N9010A(); 
%             app.obj.Set_Marker_onPeak(1)
% 
%             times = range / resolution;
% 
%             C = [times 4];
%             J = {'string','double','double','double'};
%             P = ["No.","Step_Size","Power","Freq"];
%             T =  table('Size',C,'VariableTypes',J,'VariableNames',P);
%             
%             
% 
%             for step_times = 1:(times + 1) 
% 
%                 Step_Size = (step_times - 1) * resolution;
% 
%                 MyArcus.PositionTo(Step_Size);
%                 pause (seconds)
% 
%                 Power = str2double(app.obj.Get_Marker_Power(1));
%                 Freq  = str2double(app.obj.Get_Marker_Freq(1));
%                 
%                 T(step_times,:) = {step_times,Step_Size, Power, Freq};
%                 pause(0.5)
%                 
%             end 
%             pause (1)
%             MyArcus.PositionTo(0);
% end






% function T = Auto_test(range, resolution, seconds)
%             app.obj = Analyzer_EXA_N9010A(); 
%             app.obj.Set_Marker_onPeak(1)
% 
%             times = range / resolution;
% 
%             C = [times 4];
%             J = {'string','double','double','double'};
%             P = ["No.","Step_Size","Power","Freq"];
%             T =  table('Size',C,'VariableTypes',J,'VariableNames',P);
%             
%             figure
% 
%             for step_times = 1:(times + 1) 
% 
%                 Step_Size = (step_times - 1) * resolution;
% 
%                 MyArcus.PositionTo(Step_Size);
%                 pause (seconds)
% 
%                 Power = str2double(app.obj.Get_Marker_Power(1));
%                 Freq  = str2double(app.obj.Get_Marker_Freq(1));
%                                 
%                 T(step_times,:) = {step_times,Step_Size, Power, Freq};
%                 
%                 
%                 hold on;
%                 polarpattern(Step_Size, Power, 'LineStyle','-', 'TitleTop','Antenna Radiation Pattern',...
%                     'AngleAtTop',0, 'AngleDirection','cw','MagnitudeAxisAngle',90, 'Marker', '*');
%                 
%                 pause(0.5)
%                 
%             end 
%             x = table2array(T(:,2));
%             y = table2array(T(:,3));
%             hold on;
%             polarpattern(x, y, 'LineStyle','-', 'TitleTop','Antenna Radiation Pattern',...
%                     'AngleAtTop',0, 'AngleDirection','cw','MagnitudeAxisAngle',90);
%             pause (1)
%             MyArcus.PositionTo(0);
% end






function T = Auto_test(range, resolution, seconds)
            app.obj = Analyzer_EXA_N9010A(); 
            app.obj.Set_Marker_onPeak(1)

            times = range / resolution;

            C = [times 4];
            J = {'string','double','double','double'};
            P = ["No.","Step_Size","Power","Freq"];
            T =  table('Size',C,'VariableTypes',J,'VariableNames',P);
            
            figure
            polarplot(0,0)
            title('Antenna Radiation Pattern..!')
            ax = gca;
            ax.ThetaZeroLocation = 'top';
            ax.ThetaColor = 'blue';

            for step_times = 1:(times + 1) 

                Step_Size = (step_times - 1) * resolution;

                MyArcus.PositionTo(Step_Size);
                pause (seconds)

                Power = str2double(app.obj.Get_Marker_Power(1));
                Freq  = str2double(app.obj.Get_Marker_Freq(1));
                                
                T(step_times,:) = {step_times,Step_Size, Power, Freq};

                y=  table2array(T(:,3));
                x1 = deg2rad(Step_Size);
                mn = min(y)-30;
                mx = max(y)+5;
                hold on;
                rlim([mn mx])
                polarplot(x1, Power, 'Marker','*');

                
                
            end 
            x = table2array(T(:,2));
            y = table2array(T(:,3));
            x1 = x/180*pi;
            hold on;
            polarplot(x1, y);
            pause (1)
            MyArcus.PositionTo(0);
end