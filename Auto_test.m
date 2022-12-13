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


function Auto_test (times, degrees, seconds)
obj = Analyzer_EXA_N9010A();
a = [];
b = [];

for step_times = 1:times
    Step_Size = step_times * degrees;
    MyArcus.PositionTo(Step_Size);
    pause(1.5)
    a = obj.Get_Marker_Power(1)
    b = obj.Get_Marker_Freq(1)
    pause (seconds)
end
pause(2);
MyArcus.PositionTo(0);
end
