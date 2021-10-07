
%clc
clear


dq = daq("ni");
dq.Rate = 1000;
tim = 10;

addoutput(dq, "Dev1", "ao0", "Voltage");

ch0 = addinput(dq,'Dev1','ai0','Voltage');
ch0.TerminalConfig = 'SingleEnded';%Differential  SingleEnded
ch1 = addinput(dq,'Dev1','ai1','Voltage');
ch1.TerminalConfig = 'SingleEnded';%Differential  SingleEnded
ch2 = addinput(dq,'Dev1','ai2','Voltage');
ch2.TerminalConfig = 'SingleEnded';%Differential  SingleEnded
ch3 = addinput(dq,'Dev1','ai3','Voltage');
ch3.TerminalConfig = 'SingleEnded';%Differential  SingleEnded
ch4 = addinput(dq,'Dev1','ai4','Voltage');
ch4.TerminalConfig = 'SingleEnded';%Differential  SingleEnded
ch5 = addinput(dq,'Dev1','ai5','Voltage');
ch5.TerminalConfig = 'SingleEnded';%Differential  SingleEnded
ch6 = addinput(dq,'Dev1','ai6','Voltage');
ch6.TerminalConfig = 'SingleEnded';%Differential  SingleEnded
ch7 = addinput(dq,'Dev1','ai7','Voltage');
ch7.TerminalConfig = 'SingleEnded';%Differential  SingleEnded

data = 5*ones(tim*dq.Rate,1);

tic
inScanData = readwrite(dq,data);


stop(dq)


x(:,1) = inScanData.Dev1_ai0; % - mean(inScanData.Dev1_ai0);
x(:,2) = inScanData.Dev1_ai1;
x(:,3) = inScanData.Dev1_ai2;
x(:,4) = inScanData.Dev1_ai3;
x(:,5) = inScanData.Dev1_ai4;
x(:,6) = inScanData.Dev1_ai5;
x(:,7) = inScanData.Dev1_ai6;
x(:,8) = inScanData.Dev1_ai7;





plot(x(:,1), 'color', 1/255*[121 81 48]);
set(gca, 'color', 'k');
hold on
plot(x(:,2), 'color', 1/255*[63 0 149]);
plot(x(:,3), 'color', 'blue');
plot(x(:,4), 'color', 1/255*[100 100 100]);
plot(x(:,5), 'color', 'red');
plot(x(:,6), 'color', 1/255*[255 133 0]);
plot(x(:,7), 'color', 'yellow');
plot(x(:,8), 'color', 'green');


% tic
% window=1000;
% for i=1:length(x)-window
%     imp(i)=ampratiomeasure(x(0+i:i+window),y(0+i:i+window));
% end
% toc



%%

% for j=1:1
%     window=1000;
%     for i=1:length(x)-window
%         ax=fft(x(0+i:i+window,j));
%         ay=fft(y(0+i:i+window));
%         imp2(i,j)=max(abs(ay))/max(abs(ax));
%     end
% end

%
% npts = length(data);
% Fs = dq.Rate;
%
% X=fft(x);
% Y=fft(y);
%
% NumUniquePts = ceil((npts+1)/2);
% f = (0:NumUniquePts-1)*Fs/npts;
%
% [mag_x idx_x] = max(abs(X));
% [mag_y idx_y] = max(abs(Y));
% % determine the phase difference
% % at the maximum point.
% px = angle(X(idx_x));
% py = angle(Y(idx_y));
% phase_lag = py - px
% % determine the amplitude scaling
% amplitude_ratio = mag_y/mag_x
%
