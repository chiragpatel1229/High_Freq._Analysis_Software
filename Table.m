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



%% ...
%2021a model does not require any specific data type for the polar diagram 
% BUT 2022b does need to have a specific datatype.
% smaple code rushabh na email ma che \ 