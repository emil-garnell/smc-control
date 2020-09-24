function [pos] = smc_quick_jog(displ)

% moves the translation using the keyboard

% pos = [x ; y];

%% create serial port communication

addpath(genpath('hebi'));

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

smc_find_ref(URB_Ojt); % find reference position

%% initialize keyboard
kb = HebiKeyboard();

%% move
cpt=1;
while cpt==1

state = read(kb);

if state.RIGHT
    smc_rel_move([displ,0],URB_Ojt); end
if state.LEFT
    smc_rel_move([-displ,0],URB_Ojt); end
if state.UP
    smc_rel_move([0,displ],URB_Ojt); end
if state.DOWN
    smc_rel_move([0,-displ],URB_Ojt); end

if state.CTRL
    cpt=0; end
end

pos=smc_get_pos(URB_Ojt);

disp(pos);

%% close serial port

fclose(URB_Ojt);
delete(URB_Ojt);
rmpath(genpath('hebi'));

end

