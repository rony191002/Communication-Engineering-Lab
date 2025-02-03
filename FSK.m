
clc; #... Clear command line
clear all; #... Clear variables
close all; #... Clear figures

bits = [1 0 1 1 0 0 1];

#... Modulation
bitrate = 1;

sampling_rate = 100;
sampling_time = 1/sampling_rate;

end_time = length(bits)/bitrate;
time = 0:sampling_time:end_time;

a = 3; #... Amplitude
subplot(3,1,1);
signal_one = a*sin(2*pi*4*time);
subplot(3,1,1);
plot(time,signal_one);

modulation = a*sin(2*pi*2*time);
subplot(3,1,2);
plot(time,modulation);

index = 1;

for i = 1:length(time)
    if bits(index) == 1
        modulation(i) = signal_one(i);
    endif
    if time(i)*bitrate >= index
        index = index+1;
    endif
endfor
subplot(3,1,3);
plot(time, modulation);
axis([0 end_time -2*a 2*a]);
grid on;

#... Demodulation
index = 1;

for i = 1:length(modulation)
    if modulation(i) != signal_one(i)
        demodultaion(index) = 0;
    else
        demodultaion(index) = 1;
    endif
    if time(i)*bitrate >= index
        index = index+1;
    endif
endfor

disp(demodultaion);

