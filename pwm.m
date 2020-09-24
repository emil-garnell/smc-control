function [s] = pwm(time,f,r)

% generate pwm signal of amplitude 0 - 1
% time is the time vector
% f is the pwm frequency
% r is the pwm ratio : r = 1  gives s = 1, r=0 gives s = 0

% s is the pwm signal

st = 0.5*(1+sawtooth(2*pi*f*time));

value = ones(size(time))*(1-r);

% plot(time,st); hold on
% plot(time,value);

s = double(st>=value);

end

