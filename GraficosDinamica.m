function [  ] = GraficosDinamica(koa,idx,y,MR,M,gjuntas,antropometria,spline,splinef)
% Realiza gráficos relativos à analise dinâmica do sistema multicorpo
% Inputs:
% Tipo de análise (koa); Ponto de análise (idx); o y vai ter q e qpt; Massas
% relativas (MR); Momentos (M); Angulos (teta); Velocidades angulares
% (dteta); Acelerações angulares (d2teta); Forças (lambda); Matriz com
% valores antropométricos (antropometria);
%splines dos angulos (spline)

%% Dados
T=(1:106)/106;
global Massa
D=zeros(1,length(T));

%% Identificação dos pontos
%7-anca direita
%8-anca esquerda
%9-joelho direito
%11-tornozelo direito
%10-joelho esquerdo
%12-tornozelo esquerdo

if koa == 0 || koa == 2
switch idx    
    case 7
        name='Right hip';
        angvel=-degtorad(ppval(spline(2,idx).int,0.1:0.01:1.15));
        moment=M(13,:)/Massa;
        RFX=gjuntas(21,:)/Massa;
        RFZ=gjuntas(22,:)/Massa;
    case 8
        name='Left hip';
        angvel=-degtorad(ppval(spline(2,idx).int,0.1:0.01:1.15));
        moment=M(15,:)/Massa;
        RFX=gjuntas(25,:)/Massa;
        RFZ=gjuntas(26,:)/Massa;

    case 9
        name='Right knee';
        angvel=degtorad(ppval(spline(2,idx).int,0.1:0.01:1.15));
        moment=M(18,:)/Massa;
        RFX=gjuntas(29,:)/Massa;
        RFZ=gjuntas(30,:)/Massa;

    case 11
        name='Right ankle';
        angvel=degtorad(ppval(spline(2,idx).int,0.1:0.01:1.15));
        moment=M(21,:)/Massa;
        RFX=gjuntas(37,:)/Massa;
        RFZ=gjuntas(38,:)/Massa;
    case 10
        name='Left knee';
        angvel=degtorad(ppval(spline(2,idx).int,0.1:0.01:1.15));
        moment=M(20,:)/Massa;
        RFX=gjuntas(33,:)/Massa;
        RFZ=gjuntas(34,:)/Massa;
    case 12
        name='Left ankle';
        angvel=degtorad(ppval(spline(2,idx).int,0.1:0.01:1.15));
        moment=M(23,:)/Massa;
        RFX=gjuntas(41,:)/Massa;
        RFZ=gjuntas(42,:)/Massa;
end
end

%% Switch
% 0 - Momento e reacções
% 1 - Energias
% 2 - Potencias
% 3 - EMG
% 4 - GRF
% 5 - Momento do suporte

    switch koa
        
%% Dinamica
        
        case 0

figure('name',strcat(name,' (Dynamic Analysis)'),'numbertitle','off')

    subplot(2,2,[1 2])                  
        plot(T,moment,'b',T,D,'k','LineWidth',2);
        title(strcat(name,' Moment'));            %Título do sub-gráfico
        xlabel('% of stride');            %Legendas
        ylabel('Moment (N.m/Kg)');      
        axis tight;

    subplot(2,2,3)                  
        plot(T,RFX,'r','LineWidth',2);
        title(strcat(name,' Reaction Force (X axis)')); %Título do sub-gráfico
        xlabel('% of stride');            %Legendas
        ylabel('Force (N/Kg)');
        axis tight;
        
    subplot(2,2,4)                  
        plot(T,RFZ,'r','LineWidth',2);
        title(strcat(name,' Reaction Force (Z axis)')); %Título do sub-gráfico
        xlabel('% of stride');            %Legendas
        ylabel('Force (N/Kg)');
        axis tight;
        
%Dimensiona a janela para fullscreen        
screen_size = get(0, 'ScreenSize');
f1 = figure(1);
set(f1, 'Position', [15 50 (screen_size(3)-25) (screen_size(4)-135)] );

% Os dados gráficos são guardados em .jpeg 
savename1=strcat('ResultadosDin/',strcat(name,'/'),name,' (Dynamic Analysis).jpeg');
saveas(f1,savename1);
pause;
close all

% Pergunta se quer gravar as imagens
choice = questdlg('Would you like to save current analysis as .jpeg files? (@ ResultadosDin folder)', ...
	'Save data', ...
	'Yes','No','No');
% Handle response
switch choice
    case 'No'
        delete(savename1);
end





%% Cinetica e gravitica
        case 1
qgrafico   = y(:,1:52);
P=Potencial(qgrafico,antropometria);
C=Cinetica(y,MR);

figure('name','Kinetic (Red), Potetial (Blue) and Total (Green) Energy','numbertitle','off')
                 
        plot(T,C,'r',T,P,'b',T,P+C,'g','LineWidth',2);
        title('Kinetic (Red), Potetial (Blue) and Total (Green) Energy');            %Título do sub-gráfico
        xlabel('% of stride');            %Legendas
        ylabel('Energy (J)');     
        axis auto;
    
%Dimensiona a janela para fullscreen        
screen_size = get(0, 'ScreenSize');
f2 = figure(1);
set(f2, 'Position', [15 50 (screen_size(3)-25) (screen_size(4)-135)] );

% Os dados gráficos são guardados em .jpeg 
savename2=strcat('ResultadosDin/Kinetic and Potetial Energy.jpeg');
saveas(f2,savename2);
pause;
close all

% Pergunta se quer gravar as imagens
choice = questdlg('Would you like to save current analysis as .jpeg files? (@ ResultadosDin folder)', ...
	'Save data', ...
	'Yes','No','No');
% Handle response
switch choice
    case 'No'
        delete(savename2);
end





%% Potencia
        case 2
            
                     
figure('name',strcat(name,' (Power Analysis)'),'numbertitle','off')

    subplot(3,1,1)                  
        plot(T,angvel,'r',T,D,'k','LineWidth',2);
        title(strcat(name,' Angular Velocity'));            %Título do sub-gráfico
        xlabel('% of stride');            %Legendas
        ylabel('^d/_d_t theta (rad/s)');      
        axis tight;

    subplot(3,1,2)                  
        plot(T,moment,'b',T,D,'k','LineWidth',2);
        title(strcat(name,' Moment')); %Título do sub-gráfico 
        xlabel('% of stride');            %Legendas
        ylabel('Moment (N.m/Kg)');
        axis tight;
        
    subplot(3,1,3)                  
        plot(T,moment.*angvel,'g',T,D,'k','LineWidth',2);
        title(strcat(name,' Power')); %Título do sub-gráfico
        xlabel('% of stride');            %Legendas
        ylabel('Power (Watt/Kg)');
        axis tight;
        
%Dimensiona a janela para fullscreen        
screen_size = get(0, 'ScreenSize');
f3 = figure(1);
set(f3, 'Position', [15 50 (screen_size(3)-25) (screen_size(4)-135)] );

% Os dados gráficos são guardados em .jpeg 
savename3=strcat('ResultadosDin/',strcat(name,'/'),name,' (Power Analysis).jpeg');
saveas(f3,savename3);
pause;
close all

% Pergunta se quer gravar as imagens
choice = questdlg('Would you like to save current analysis as .jpeg files? (@ ResultadosDin folder)', ...
	'Save data', ...
	'Yes','No','No');
% Handle response
switch choice
    case 'No'
        delete(savename3);

end





%%  EMG
        case 3

%Dados       

emgdata=EMG().*10^6;
stride=(1:length(emgdata));
stride=stride/length(emgdata);


figure('name','EMG Analysis (Lateral Gastrocnemius)','numbertitle','off')                  
        plot(stride,emgdata(:,1),'b','LineWidth',2);
        title('Lateral Gastrocnemius EMG');            %Título do sub-gráfico
        xlabel('% of stride');            %Legendas
        ylabel('micro V');      
        axis tight;

%Dimensiona a janela para fullscreen        
screen_size = get(0, 'ScreenSize');
f4 = figure(1);
set(f4, 'Position', [15 50 (screen_size(3)-25) (screen_size(4)-135)] );

% Os dados gráficos são guardados em .jpeg 
savename4=strcat('ResultadosDin/EMG Analysis (Lateral Gastrocnemius).jpeg');
saveas(f4,savename4);
pause
close all


figure('name','EMG Analysis (Tibialis Anterior)','numbertitle','off') 
        plot(stride,emgdata(:,2),'b','LineWidth',2);
        title('Tibialis Anterior EMG'); %Título do sub-gráfico 
        xlabel('% of stride');            %Legendas
        ylabel('micro V');
        axis tight;
        
%Dimensiona a janela para fullscreen        
screen_size = get(0, 'ScreenSize');
f5 = figure(1);
set(f5, 'Position', [15 50 (screen_size(3)-25) (screen_size(4)-135)] );

% Os dados gráficos são guardados em .jpeg 
savename5=strcat('ResultadosDin/EMG Analysis (Tibialis Anterior).jpeg');
saveas(f5,savename5);
pause
close all



figure('name','EMG Analysis (Biceps Femoris)','numbertitle','off')                  
        plot(stride,emgdata(:,3),'b','LineWidth',2);
        title('Biceps Femoris EMG'); %Título do sub-gráfico
        xlabel('% of stride');            %Legendas
        ylabel('micro V');
        axis tight;

%Dimensiona a janela para fullscreen        
screen_size = get(0, 'ScreenSize');
f6 = figure(1);
set(f6, 'Position', [15 50 (screen_size(3)-25) (screen_size(4)-135)] );

% Os dados gráficos são guardados em .jpeg 
savename6=strcat('ResultadosDin/EMG Analysis (Biceps Femoris).jpeg');
saveas(f6,savename6);
pause
close all
        

figure('name','EMG Analysis (Rectus Femoris)','numbertitle','off')                  
        plot(stride,emgdata(:,4),'b','LineWidth',2);
        title('Rectus Femoris EMG'); %Título do sub-gráfico
        xlabel('% of stride');            %Legendas
        ylabel('micro V');
        axis tight;
        
%Dimensiona a janela para fullscreen        
screen_size = get(0, 'ScreenSize');
f7 = figure(1);
set(f7, 'Position', [15 50 (screen_size(3)-25) (screen_size(4)-135)] );

% Os dados gráficos são guardados em .jpeg 
savename7=strcat('ResultadosDin/EMG Analysis (Rectus Femoris).jpeg');
saveas(f7,savename7);
pause
close all
        

% Pergunta se quer gravar as imagens
choice = questdlg('Would you like to save current analysis as .jpeg files? (@ ResultadosDin folder)', ...
	'Save data', ...
	'Yes','No','No');
% Handle response
switch choice
    case 'No'
        delete(savename4,savename5,savename6,savename7);

end





%% Ground Reaction Forces
        case 4
grfDx=ppval(splinef(1,3).int,T)/Massa;
grfDz=ppval(splinef(1,4).int,T)/Massa;
apDx=ppval(splinef(1,5).int,T);

grfEx=ppval(splinef(1,7).int,T)/Massa;
grfEz=ppval(splinef(1,8).int,T)/Massa;
apEx=ppval(splinef(1,9).int,T);

            

figure('name','Ground Reaction Forces and application points','numbertitle','off')
        
    subplot(3,1,1)
        plot(T,grfDx,'b',T,grfEx,'r','LineWidth',2);
        title('Ground Reaction Force (x axis) (Right Foot - Blue | Left Foot - Red)');            %Título do sub-gráfico
        xlabel('% of stride');            %Legendas
        ylabel('Force (N/Kg)');      
        axis tight;
    
    subplot(3,1,3)
        plot(T,apDx,'b',T,apEx,'r','LineWidth',2);
        title('Application point (x axis) (Right Foot - Blue | Left Foot - Red)');            %Título do sub-gráfico
        xlabel('% of stride');            %Legendas
        ylabel('Distance (m)');      
        axis tight;
    
            
    subplot(3,1,2)
        plot(T,grfDz,'b',T,grfEz,'r','LineWidth',2);
        title('Ground Reaction Force (z axis) (Right Foot - Blue | Left Foot - Red)');            %Título do sub-gráfico
        xlabel('% of stride');            %Legendas
        ylabel('Force (N/Kg)');      
        axis tight;
        
%     subplot(4,1,4)
%         plot(T,apDz,'b',T,apEz,'r','LineWidth',2);
%         title('Application point (z axis) (Right Foot - Blue | Left Foot - Red)');            %Título do sub-gráfico
%         xlabel('% of stride');            %Legendas
%         ylabel('Distance (m)');      
%         axis tight;

        
%Dimensiona a janela para fullscreen        
screen_size = get(0, 'ScreenSize');
f8 = figure(1);
set(f8, 'Position', [15 50 (screen_size(3)-25) (screen_size(4)-135)] );

% Os dados gráficos são guardados em .jpeg 
savename8=strcat('ResultadosDin/Ground Reaction Forces.jpeg');
saveas(f8,savename8);
pause;
close all

% Pergunta se quer gravar as imagens
choice = questdlg('Would you like to save current analysis as .jpeg files? (@ ResultadosDin folder)', ...
	'Save data', ...
	'Yes','No','No');
% Handle response
switch choice
    case 'No'
        delete(savename8);

end

%% Momento do suporte
        case 5
        momentoD=(M(13,:)+M(18,:)+M(21,:))/Massa;
        momentoE=(M(15,:)+M(20,:)+M(23,:))/Massa;
        % 
        figure('name','Support moment (Right leg (blue) & Left leg (red))','numbertitle','off')
                 
        plot(T,momentoD,'b',T,momentoE,'r',T,D,'k','LineWidth',2);
        title('Support moment (Right leg (blue) & Left leg (red))');            %Título do sub-gráfico
        xlabel('% of stride');            %Legendas
        ylabel('Moment (N.m/Kg)');     
        axis tight;
    
%Dimensiona a janela para fullscreen        
screen_size = get(0, 'ScreenSize');
f9 = figure(1);
set(f9, 'Position', [15 50 (screen_size(3)-25) (screen_size(4)-135)] );

% Os dados gráficos são guardados em .jpeg 
savename9=strcat('ResultadosDin/Support Moment.jpeg');
saveas(f9,savename9);
pause;
close all

% Pergunta se quer gravar as imagens
choice = questdlg('Would you like to save current analysis as .jpeg files? (@ ResultadosDin folder)', ...
	'Save data', ...
	'Yes','No','No');
% Handle response
switch choice
    case 'No'
        delete(savename9);
end
    end
end

