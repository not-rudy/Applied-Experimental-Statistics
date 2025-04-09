%% MAE 301: Applied Experimental Statistics
% Final Project: NASA Airfoil Self-Noise
% Members: Rudy Medrano, Justin Moralas, Omar Elaqad

%% Initialize
clc; clear; close all;

%% Establish Given Information

Data = readmatrix("AirfoilSelfNoise.csv"); % Imports Data
Frequency = Data(:,1); % Frequency, in Hertz [Hz]
alpha = Data(:,2); % Angle of Attacks, in degrees [deg]
c = Data(:,3); % Chord Length, in meters [m]
U_inf = Data(:,4); % Free-Stream Velocity, in meters per second [m/s]
delta = Data(:,5); % Suction Side Displacement Thickness, in meters [m]
SSPL = Data(:,6); % Scaled Sound Pressure Level, in deibels [dB]

%% Experiment 1: Chord Length and Free Stream Velocity as a function of SSPL
% Constants: f = 2000 Hz, alpha = 0 deg, U_inf = 71.3 m/s, delta =
% 0.00497773 m

% Filter for freq = 2000 Hz, alpha = 0, U_inf = 71.3
target_freq = 2000;
target_alpha = 0;
target_Uinf = 71.3;

idx = (Frequency == target_freq) & (alpha == target_alpha) & (U_inf == target_Uinf);

% Use filtered data
chord_filtered = c(idx);
SSPL_filtered = SSPL(idx);

% Optional: Check delta if needed
delta_filtered = delta(idx);

%% Plot: SSPL vs Chord Length (with all conditions fixed)
figure;
scatter(chord_filtered, SSPL_filtered, 'filled')
xlabel('Chord Length [m]')
ylabel('SSPL [dB]')
title('SSPL vs Chord Length (Freq = 2000 Hz, Alpha = 0°, U∞ = 71.3 m/s)')
grid on