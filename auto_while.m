

function T = auto_while(range, resolution, seconds)
            app.obj = Analyzer_EXA_N9010A();  
            MyArcus.PositionTo(0); %(check it with the if statement) 
            times = range / resolution;
            C = [times 4];
            J = {'string','double','double','double'};
            P = ["No.","Step_Size","Power","Freq"];
            T =  table('Size',C,'VariableTypes',J,'VariableNames',P);
            step_times = 0;
            while step_times<times
                step_times = step_times+1;
                Step_Size = step_times * resolution;
                MyArcus.PositionTo(Step_Size);
                pause (1)
                Power = str2double(app.obj.Get_Marker_Power(1));
                Freq  = str2double(app.obj.Get_Marker_Freq(1));
                T(step_times,:) =  {step_times,Step_Size, Power, Freq};
                pause(seconds);
            end 
            MyArcus.PositionTo(0);
end 



