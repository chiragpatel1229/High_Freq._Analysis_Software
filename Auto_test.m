% % MyArcus.PositionTo(i);
% function Trial_arcus_position
%     for i = 1:2
%        a = i * 45;
%        pause(1);
%        MyArcus.PositionTo(a);
%     end
%     pause(2);
%     MyArcus.PositionTo(0);
% end


function Auto_test(times, degrees, seconds)
            app.obj = Analyzer_EXA_N9010A();
            
            H = table([],[],[],'VariableNames', ["Step_Size", "Power", "Freq"]);
            app.UITable = [];
            for step_times = 1:times 
                Step_Size = step_times * degrees;
                MyArcus.PositionTo(Step_Size);
                Power = str2double(app.obj.Get_Marker_Power(1));
                Freq  = str2double(app.obj.Get_Marker_Freq(1));
                H(end+1,:) = {Step_Size, Power, Freq} % Add new rows of data in the loop
                pause(seconds);
            end
            pause(2);
            MyArcus.PositionTo(0);
        end 
