function [URB_Ojt] = smc_create()
% create serial port communication object

URB_Ojt = instrfind;

% Create the serial port object if it does not exist
% otherwise use the object that was found.
if isempty(URB_Ojt)==0
    fclose(URB_Ojt);
    delete(URB_Ojt)
end

URB_Ojt=serial('COM3','BaudRate',57600,'DataBits',8,'FlowControl','software',...
            'Terminator','CR/LF');


end

