clear
close all

% Displacement coordinates are given in mm

% the first time the controler is called after being switched on,
% it takes time, since it needs to initialize and find its zero


%% 'quick' scripts : no need to initialize communication

% go to position 'pos'
x=10;
y=20;
smc_quick_move(x,y);

% move using keyboard by step 'step', press ctrl when finished to obtain current position
step = 2;
smc_quick_jog(step);


%% scripts with prior initialization
% useful to move several times inside a loop
% initialisation and creation of the serial port object are done only once

% Create a serial port object.
URB_Ojt = smc_create();

% open communication
fopen(URB_Ojt);

% initialization
smc_find_ref(URB_Ojt); % find reference position

% perform desired displacements
pos = [50;40];
relpos = [10;-10];

steptime=smc_get_time(pos,URB_Ojt); % get estimate of time needed to move to pos
smc_move_to(pos,URB_Ojt); % move to pos
smc_rel_move(relpos,URB_Ojt); % relative move of relpos
smc_get_pos(URB_Ojt); % get current position
smc_jog(step,URB_Ojt); % move using keyboard by step, press ctrl when finished

% close communication
fclose(URB_Ojt);
delete(URB_Ojt);


