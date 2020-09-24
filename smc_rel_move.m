function [ ] = smc_rel_move( new_pos,URB_Ojt )

% relative move of new_pos and waits until this is done.

if max(abs(new_pos))~=0
 
% steptime = query(URB_Ojt,['2PT',num2str(max(abs(new_pos)))]);
% steptime = str2double(steptime(4:end));

fprintf(URB_Ojt,['1pr',num2str(single(new_pos(1)))]);
fprintf(URB_Ojt,['2pr',num2str(single(-new_pos(2)))]);
 
% pause(steptime+0.1); 
pause(0.01); 
end

end

