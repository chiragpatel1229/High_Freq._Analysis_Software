

function H = Auto_test(times, degrees, seconds)
            app.obj = Analyzer_EXA_N9010A();
            H = table([],[],[],[],'VariableNames',["No.","Step_Size","Power","Freq"]);
            for step_times = 1:times 
                Step_Size = step_times * degrees;
                MyArcus.PositionTo(Step_Size);
                Power = str2double(app.obj.Get_Marker_Power(1));
                Freq  = str2double(app.obj.Get_Marker_Freq(1));
                H(end+1,:) =  {step_times,Step_Size, Power, Freq}
                pause(seconds);
            end
            pause(2);
            MyArcus.PositionTo(0);
        end 
