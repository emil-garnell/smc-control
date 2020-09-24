function [ ] = smc_move_to( new_pos,URB_Ojt )
% move to new_pos and waits until this is done.

steptime=smc_get_time(new_pos,URB_Ojt);

 fprintf(URB_Ojt,['1pa',num2str(single(new_pos(1)))]);
 fprintf(URB_Ojt,['2pa',num2str(single(-new_pos(2)))]);
 
 pause(steptime+0.1); 

end

