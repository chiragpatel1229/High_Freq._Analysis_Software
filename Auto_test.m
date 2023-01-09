

function T = Auto_test(range, resolution, seconds)
            app.obj = Analyzer_EXA_N9010A(); 
            app.obj.Set_Marker_onPeak(1)

            

            times = range / resolution;

            C = [times 4];
            J = {'string','double','double','double'};
            P = ["No.","Step_Size","Power","Freq"];
            T =  table('Size',C,'VariableTypes',J,'VariableNames',P);

            for step_times = 1:(times + 1) 

                Step_Size = (step_times - 1) * resolution;

                MyArcus.PositionTo(Step_Size);
                pause (seconds)

                Power = str2double(app.obj.Get_Marker_Power(1));
                Freq  = str2double(app.obj.Get_Marker_Freq(1));
                
                T(step_times,:) = {step_times,Step_Size, Power, Freq};
                pause(0.5)
                
            end 
            pause (1)
            MyArcus.PositionTo(0);
end
