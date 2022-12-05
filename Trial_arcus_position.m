% MyArcus.PositionTo(i);
function Trial_arcus_position
    for i = 1:4
       a = i * 45; 
       pause(1)
       MyArcus.PositionTo(a)
    end
    pause(2)
    MyArcus.PositionTo(0)
end