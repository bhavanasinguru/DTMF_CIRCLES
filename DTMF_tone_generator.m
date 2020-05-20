global keyNames tone_all h1 h2
fs=8000;
t=[0:1:204*5]/fs;
%for some time duration
x=zeros(1,length(t));
x(1)=1;

dtmf.keys = ...
   ['1','2','3','4','5','6','7';
    '8','9','0','A','B','C','D';
    'E','F','G','H','I','J','K';
    'L','M','N','O','P','Q','R';
    'S','T','U','V','W','X','Y';
    'Z','@',',','a','b','c','d'];

dtmf.colTones = ones(8,1)*[1209,1336,1477,1633,1709,1919,2062];
dtmf.rowTones = [697;770;852;941;1050;1146]*ones(1,7);
keyName=keyNames(length(keyNames));
[r,c] = find(dtmf.keys==keyName); % find row and col for keyname
tone=filter([0 sin(2*pi*dtmf.rowTones(r,c)/fs) ],[1 -2*cos(2*pi*dtmf.rowTones(r,c)/fs) 1],x) + filter([0 sin(2*pi*dtmf.colTones(r,c)/fs) ],[1 -2*cos(2*pi*dtmf.colTones(r,c)/fs) 1],x);

soundsc(tone,fs);
tone_all=[tone_all,zeros(1,400),tone];
display(size(t));
display(size(tone));

h1=subplot(2,3,2);plot(t,tone);grid on;
title('Signal tone');
ylabel('Amplitude');
xlabel('time (second)');
axis([0 0.035 -2 2]);

Ak=2*abs(fft(tone))/length(tone);
Ak(1)=Ak(1)/2;%0.0015
f=[0:1:(length(tone)-1)/2]*fs/length(tone);
h2=subplot(2,3,5);plot(f,Ak(1:(length(tone)+1)/2));grid on
title('Spectrum for tone');
ylabel('Amplitude');
xlabel('frequency (Hz)');
axis([500 2000 0 1]);