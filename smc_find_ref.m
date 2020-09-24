function [  ] = smc_find_ref( URB_Ojt )
% Initializes the SMC100 controler

isref=query(URB_Ojt,'1TS');
if str2double(isref(8))==0
fprintf(URB_Ojt,'1or'); %  execute 'homing' state (Changes Solid Orange to Solid Green)
pause(10);
end

isref=query(URB_Ojt,'2TS');
if str2double(isref(8))==0
fprintf(URB_Ojt,'2or'); %  execute 'homing' state (Changes Solid Orange to Solid Green)
pause(10);
end

end

