function [ ] = smc_quick_move(x,y )
% makes a single move of the head to x y

pos = [x ; y];

%% create serial port communication

% Create a serial port object.
URB_Ojt = instrfind;

% Create the serial port object if it does not exist
% otherwise use the object that was found.
if isempty(URB_Ojt)==0
    fclose(URB_Ojt);
    delete(URB_Ojt)
end
URB_Ojt=serial('COM3','BaudRate',57600,'DataBits',8,'FlowControl','software',...
            'Terminator','CR/LF');

fopen(URB_Ojt);


%% initialisation
% fprintf(URB_Ojt,'2rs'); % hardware reset
% fprintf(URB_Ojt,'1pw0'); % '0' = change state from 'configuration' to 'non-referenced'
% fprintf(URB_Ojt,'2pw0'); 
% fprintf(URB_Ojt,'1ht1'); % set 'homing' state ex: '0' = set to 'MZ' default; '1' = set to current position

smc_find_ref(URB_Ojt); % find reference position

smc_move_to(pos,URB_Ojt); % move to home


%% close serial port

fclose(URB_Ojt);
delete(URB_Ojt);



end

