clear all; close all; clc; format compact
 
% Define parameters of circuit
R = 10e3     % Update according to resistor used in circuit
C = 10e-6 % Capacitance
 
tau = R*C % Time constant
 
% Load in data
 
% OPTION 1: If loading file from your local machine:
A = csvread('10k.csv',2,1);
 
% Extract and assign data
Vin = A(:,1);
Vc = A(:,2);
for i = 1:length(Vin)
   Vin(i) = Vin(i) / (512.0/5.0); % Conversion to Voltage
end

for i = 1:length(Vc)
   Vc(i) = Vc(i) / (512.0/5.0); 
end
 
% Create index of time array
t = []
t(1) = tau/50;
 
for i = 2:length(Vin)
    t(i) = t(i-1) + tau/50;    
end
 
% Plot data
figure(1);hold on
plot(t,Vin,'b','LineWidth',4)
plot(t,Vc,'r','LineWidth',4)
grid minor
ylim([0,5]);
legend('V_i_n','V_C','Location','NorthEast')
title('Analysis of RC Circuit Data')
xlabel('Time [sec]')
ylabel('Volts [V]')