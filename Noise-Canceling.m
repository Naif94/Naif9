
clc;
clear all;
%Read the original audio file without any noise
[y1, Fs]= audioread('Muc.mov');
info= audioinfo('Muc.mov');
audio_signal = y1(:, 1); %Using only the left channel of the stereo sound
%Time duration of the audio signal
audio_total_time = (length(audio_signal) - 1) / Fs;
disp('Playing the original audio...');
subplot(4,1,1)
plot(audio_signal)% plot the signal for audio
title('original audio signal')
soundsc(audio_signal, Fs); %Audio without noise
pause(audio_total_time + 5); %Pause for the audio to finish before playing the next

%Add ambient noise to the audio signal
f = 1000; %frequency of the noise signal
n_vec = (0 : length(audio_signal)-1)';
noise_signal = 0.5 * max(audio_signal) * sin(2*pi*f/Fs*n_vec);
disp('Playing the ambient noise signal...');
subplot(4,1,2)
plot(noise_signal,'r')
title('ambient noise signal')% Ploting the noise signal
soundsc(noise_signal, Fs); %Noise only
pause(audio_total_time + 5); %Pause for the audio to finish before playing the next audio


%Audio with ambient noise
audio_with_noise_signal = audio_signal + noise_signal;
disp('Playing the audio signal with ambient noise');
subplot(4,1,3)
plot(audio_with_noise_signal)% Ploting the noise signal+ audio_signal
title('audio signal + ambient noise signal')
soundsc(audio_with_noise_signal, Fs);
pause(audio_total_time + 5); %Pause for the audio to finish before playing the next audio


%Phase shift the ambient noise and add to the audio with ambient noise
noise_phase_shift_signal = 0.5 * max(audio_signal) * sin(2*pi*f/Fs*n_vec + pi);
audio_noise_filtered_signal = audio_with_noise_signal + noise_phase_shift_signal;
disp('Playing the audio signal after filtering ambient noise');
subplot(4,1,4)
plot(audio_noise_filtered_signal)
title('filtered audio signal')% Ploting filtered audio signal
soundsc(audio_noise_filtered_signal, Fs);
pause(audio_total_time); %Pause for the audio to finish before playing the






