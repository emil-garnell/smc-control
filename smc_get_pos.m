function [ x ] = smc_get_pos( URB_Ojt )
% reads the actual position of the head
x=zeros(2,1);

posstr1 = query(URB_Ojt, '1TP?');
posstr2 = query(URB_Ojt, '2TP?');
x(1)= str2double(posstr1(4:end));
x(2)= -str2double(posstr2(4:end));

end

