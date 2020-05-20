close all;clear;clc;
%% Main program
global keyNames tone_all h1 h2 h3 h4 Decode_output
keyNames=[];
tone_all=[];
Decode_output=[];


h1=subplot(2,3,2);grid on;
title('Signal tone');
ylabel('Amplitude');
xlabel('time (second)');
axis([0 0.035 -2 2]);

h2=subplot(2,3,5);grid on;
title('Spectrum for tone');
ylabel('Amplitude');
xlabel('frequency (Hz)');
axis([500 2000 0 1]);

h3=subplot(2,3,3);grid on;
title('BPF frequency responses');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
axis([500 2000 0 1]);

h4=subplot(2,3,6);grid on;
title('Decode Spectrum');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
axis([500 2000 0 1]);
%% Button and UI Window
set(gcf,'Units','centimeters','position',[1 2 49 24],'Name','DTMF_Main'); % UI Window Position

bip=[100,600]; % button inital position
bs=60; % button inital size

AuthorDisplay=uicontrol('Style', 'text', 'Position',[bip+[0 bs*3],320,35],'String', 'Designed by bhavana','FontSize',20,'HorizontalAlignment','left','BackgroundColor',[0.937 0.867 0.867]);

InputDisplay=uicontrol('Style', 'text', 'Position',[bip+[0 bs*2],85,35],'String', 'Input : ','FontSize',20,'HorizontalAlignment','left','BackgroundColor',[0.839 0.91 0.851]);

Display=uicontrol('Style', 'text', 'Position',[bip+[0 bs*1],385,35],'String', 'KeyNames','FontSize',15,'HorizontalAlignment','left','FontSize',20,'BackgroundColor',[0.973 0.973 0.973]);
set(Display,'String',keyNames); % Property
button1 = uicontrol; % Generate Button
set(button1,'String','1','Position',[bip,repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]);
set(button1,'Callback','button_1');
button2 = uicontrol; % Generate Button
set(button2,'String','2','Position',[bip+[bs*1 0],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(button2,'Callback','button_2');
button3 = uicontrol; % Generate Button
set(button3,'String','3','Position',[bip+[bs*2 0],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(button3,'Callback','button_3');
button4 = uicontrol; % Generate Button
set(button4,'String','4','Position',[bip+[bs*3 0],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(button4,'Callback','button_4');
button5 = uicontrol; % Generate Button
set(button5,'String','5','Position',[bip+[bs*4 0],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(button5,'Callback','button_5');
button6 = uicontrol; % Generate Button
set(button6,'String','6','Position',[bip+[bs*5 0],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]);
set(button6,'Callback','button_6');
button7 = uicontrol; % Generate Button
set(button7,'String','7','Position',[bip+[bs*6 0],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]);
set(button7,'Callback','button_7');
button8 = uicontrol; % Generate Button
set(button8,'String','8','Position',[bip+[0 -bs*1],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(button8,'Callback','button_8');
button9 = uicontrol; % Generate Button
set(button9,'String','9','Position',[bip+[bs*1 -bs*1],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]);
set(button9,'Callback','button_9');
button0 = uicontrol; % Generate Button
set(button0,'String','0','Position',[bip+[bs*2 -bs*1],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(button0,'Callback','button_0');
buttonA = uicontrol; % Generate Button
set(buttonA,'String','A','Position',[bip+[bs*3 -bs*1],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(buttonA,'Callback','button_A');
buttonB= uicontrol; % Generate Button
set(buttonB,'String','B','Position',[bip+[bs*4 -bs*1],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(buttonB,'Callback','button_B');
buttonC = uicontrol; % Generate Button
set(buttonC,'String','C','Position',[bip+[bs*5 -bs*1],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(buttonC,'Callback','button_C');
buttonD = uicontrol; % Generate Button
set(buttonD,'String','D','Position',[bip+[bs*6 -bs*1],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(buttonD,'Callback','button_D');
buttonE = uicontrol; % Generate Button
set(buttonE,'String','E','Position',[bip+[0 -bs*2],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(buttonE,'Callback','button_E');
buttonF = uicontrol; % Generate Button
set(buttonF,'String','F','Position',[bip+[bs*1 -bs*2],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]);
set(buttonF,'Callback','button_F');
buttonG = uicontrol; % Generate Button
set(buttonG,'String','G','Position',[bip+[bs*2 -bs*2],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(buttonG,'Callback','button_G');
buttonH = uicontrol; % Generate Button
set(buttonH,'String','H','Position',[bip+[bs*3 -bs*2],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(buttonH,'Callback','button_H');
buttonI = uicontrol; % Generate Button
set(buttonI,'String','I','Position',[bip+[bs*4 -bs*2],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(buttonI,'Callback','button_I');
buttonJ = uicontrol; % Generate Button
set(buttonJ,'String','J','Position',[bip+[bs*5 -bs*2],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(buttonJ,'Callback','button_J');
buttonK = uicontrol; % Generate Button
set(buttonK,'String','K','Position',[bip+[bs*6 -bs*2],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(buttonK,'Callback','button_K');
buttonL = uicontrol; % Generate Button
set(buttonL,'String','L','Position',[bip+[0 -bs*3],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(buttonL,'Callback','button_L');
buttonM = uicontrol; % Generate Button
set(buttonM,'String','M','Position',[bip+[bs*1 -bs*3],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]);
set(buttonM,'Callback','button_M');
buttonN = uicontrol; % Generate Button
set(buttonN,'String','N','Position',[bip+[bs*2 -bs*3],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(buttonN,'Callback','button_N');
buttonO = uicontrol; % Generate Button
set(buttonO,'String','O','Position',[bip+[bs*3 -bs*3],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(buttonO,'Callback','button_O');
buttonP = uicontrol; % Generate Button
set(buttonP,'String','P','Position',[bip+[bs*4 -bs*3],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(buttonP,'Callback','button_P');
buttonQ = uicontrol; % Generate Button
set(buttonQ,'String','Q','Position',[bip+[bs*5 -bs*3],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(buttonQ,'Callback','button_Q');
buttonR = uicontrol; % Generate Button
set(buttonR,'String','R','Position',[bip+[bs*6 -bs*3],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(buttonR,'Callback','button_R');
buttonS = uicontrol; % Generate Button
set(buttonS,'String','S','Position',[bip+[0 -bs*4],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(buttonS,'Callback','button_S');
buttonT = uicontrol; % Generate Button
set(buttonT,'String','T','Position',[bip+[bs*1 -bs*4],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]);
set(buttonT,'Callback','button_T');
buttonU = uicontrol; % Generate Button
set(buttonU,'String','U','Position',[bip+[bs*2 -bs*4],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(buttonU,'Callback','button_U');
buttonV = uicontrol; % Generate Button
set(buttonV,'String','V','Position',[bip+[bs*3 -bs*4],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(buttonV,'Callback','button_V');
buttonW = uicontrol; % Generate Button
set(buttonW,'String','W','Position',[bip+[bs*4 -bs*4],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(buttonW,'Callback','button_W');
buttonX = uicontrol; % Generate Button
set(buttonX,'String','X','Position',[bip+[bs*5 -bs*4],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(buttonX,'Callback','button_X');
buttonY = uicontrol; % Generate Button
set(buttonY,'String','Y','Position',[bip+[bs*6 -bs*4],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(buttonY,'Callback','button_Y');
buttonZ = uicontrol; % Generate Button
set(buttonZ,'String','Z','Position',[bip+[0 -bs*5],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(buttonZ,'Callback','button_Z');
buttonAt = uicontrol; % Generate Button
set(buttonAt,'String','@','Position',[bip+[bs*1 -bs*5],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]);
set(buttonAt,'Callback','button_At');
buttonComma = uicontrol; % Generate Button
set(buttonComma,'String',',','Position',[bip+[bs*2 -bs*5],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(buttonComma,'Callback','button_Coma');
buttona = uicontrol; % Generate Button
set(buttona,'String','a','Position',[bip+[bs*3 -bs*5],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(buttona,'Callback','button_extra1');
buttonb= uicontrol; % Generate Button
set(buttonb,'String','b','Position',[bip+[bs*4 -bs*5],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(buttonb,'Callback','button_extra2');
buttonc = uicontrol; % Generate Button
set(buttonc,'String','c','Position',[bip+[bs*5 -bs*5],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(buttonc,'Callback','button_extra3');
buttond = uicontrol; % Generate Button
set(buttond,'String','d','Position',[bip+[bs*6 -bs*5],repmat(bs,1,2)],'BackgroundColor',[0.804 0.878 0.969]); % Property
set(buttond,'Callback','button_extra4');
buttonSoundAll = uicontrol; % Generate Button
set(buttonSoundAll,'String','SoundAll','Position',[bip+[0 -bs*6],bs*6,bs],'BackgroundColor',[0.839 0.91 0.851]); % Property
set(buttonSoundAll,'Callback','button_SoundAll'); % button reaction and call function button_SoundAl
buttonClear = uicontrol; % Generate Button
set(buttonClear,'String','Clear','Position',[bip+[0 -bs*7],bs*6,bs],'BackgroundColor',[0.937 0.867 0.867]); % Property
set(buttonClear,'Callback','button_Clear'); % button reaction and call function button_Clear
buttonDecode = uicontrol; % Generate Button
set(buttonDecode,'String','Decode','Position',[bip+[0 -bs*8],bs*6,bs],'BackgroundColor',[0.992 0.918 0.796]); % Property
set(buttonDecode,'Callback','button_Decode'); % button reaction and call function button_Decode

DecodeDisplay=uicontrol('Style', 'text', 'Position',[bip+[0 -bs*9],bs*6,bs],'String', 'Decode : ','FontSize',20,'HorizontalAlignment','left','BackgroundColor',[0.839 0.91 0.851]);

Display2=uicontrol('Style', 'text', 'Position',[bip+[0 -bs*10],bs*6,bs],'String', 'KeyNames','FontSize',15,'HorizontalAlignment','left','FontSize',20,'BackgroundColor',[0.973 0.973 0.973]);
set(Display2,'String',Decode_output); % Property

