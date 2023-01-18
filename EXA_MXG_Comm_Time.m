h = 0;
Delay = 0.300;
fprintf("Communication Time Calculation Between EXA and MXG.\nWith %d second time pause.",Delay);
tic;
while h<20
    if h == 2
        obj1.SetPowerLevel(10);               
        fprintf("set power = 10\n");
        toc 
    elseif h == 7
        obj1.SetPowerLevel(5);                
        fprintf("set power = 5\n");
        toc 
    elseif h == 13
        obj1.SetPowerLevel(0);                
        fprintf("set power = 0\n");
        toc 
    elseif h == 18
        obj1.SetPowerLevel(15);
        fprintf("set power = 15\n");  
        toc 
    end
    pause (Delay)
    power = obj.Get_Marker_Power(1)
    toc
    h = h+1;
end

a = MyArcus.IsBusy;
% if a == 1
%     pause (0.5)
%     b = MyArcus.IsBusy;
%     fprintf("The motor is busy.");
%     if b == 1
%         return
%     end
% else     
% fprintf("The motor is free.");
% end