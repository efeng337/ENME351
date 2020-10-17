% Clear figures
clf;

x = 1:1:8;
y1 = [100.2 98.0 97.6 98.1 98.3 99.0 99.7 101.4]; %Sensor 1
y2 = [98.4 98.7 98.3 99.0 98.8 98.7 98.5 98.9];   %Sensor 2

y1Mean = mean(y1); %average value 
y2Mean = mean(y2);

for i=1:length(y1)
    y1Precision(i) = y1Mean - y1(i);  %Precision calculation
    y1Accuracy(i) = abs(y1(i) - 100); %Accuracy calculation
    y2Precision(i) = y2Mean - y2(i);
    y2Accuracy(i) = abs(y2(i) - 100);
end
%%COMPARISON HERE:
%%Sensor 1 is more accurate than Sensor 2
%%Sensor 2 is more precise than Sensor 1
disp('Sensor 1 Accuracy:') 
disp(y1Accuracy)
disp('Sensor 1 Precision:')
disp(y1Precision)
disp('Sensor 2 Accuracy:')
disp(y2Accuracy)
disp('Sensor 2 Precision:')
disp(y2Precision)
plot(x,y1,x,y2) %plot Sensor 1 and Sensor 2
title('Problem 4');
xlabel('Sample #');
ylabel('degrees Celsius');


