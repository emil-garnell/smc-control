function [ steptime ] = smc_get_time( new_pos,URB_Ojt )
% get the time needed to move from current position to new_pos

old_pos=smc_get_pos(URB_Ojt);

delta_pos=max(abs(new_pos-old_pos));

if delta_pos==0
    steptime=0;
else
    steptime = query(URB_Ojt,['2PT',num2str(delta_pos)]);
    steptime = str2double(steptime(4:end));
end

end

