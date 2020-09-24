function [pos] = smc_jog(displ,URB_Ojt)

% moves the translation using the keyboard

% pos = [x ; y];

%% initialize keyboard

addpath(genpath('hebi'));

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


end

