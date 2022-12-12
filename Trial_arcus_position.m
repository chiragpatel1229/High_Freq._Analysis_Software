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



function Trial_arcus_position (times, degrees, seconds)
a = [];
b = [];
    for step_times = 1:times 
        Step_Size = step_times * degrees;
        MyArcus.PositionTo(Step_Size);
        pause(1.5)
        c = obj.Get_Marker_Power(1);
        d = obj.Get_Marker_Freq(1);
        a = [a,c];
        b = [b,d];
        pause (seconds)       
    end
    pause(2);
    MyArcus.PositionTo(0);
end 
