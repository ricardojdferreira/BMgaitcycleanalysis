function [spline,antropometria,splineq,q0,qpto0,splinef] = datateta()
%% Acede ao ficheiro com os dados do ciclo de marcha
%             freq=100;
%             t0=0;
%             tf=1.25;
%             
%             tempoq=(0.1:0.01:1.15);
%             filename='DADOScena.xlsx';
%             sheet = 15;
%             range='A1:N127';
%             sheetq=2;
%             rangeq='E10:AH135';
%             
%             filename2='medidas.xlsx';
%             sheetant=3;
%             rangeant='A1:E12';
%             
%             filename3='FORÇAS.xlsx';
%             sheetf=1;
%             rangeflag='A2:B127';
%             rangeFD='C2:D127';
%             rangeAPD='E2:F127';
%             rangeFE='G2:H127';
%             rangeAPE='I2:J127';
           

            
            format long; % Valores com 15 casas decimais
%             rawdata=xlsread(filename,sheet,range); % raw_data é uma matriz 133 frames x 14 colunas (12 tetas e 2 trajectórias)
%             rawdataq=xlsread(filename,sheetq,rangeq);
%             
%             forcas=[xlsread(filename3,sheetf,rangeflag) xlsread(filename3,sheetf,rangeFD) xlsread(filename3,sheetf,rangeAPD) xlsread(filename3,sheetf,rangeFE) xlsread(filename3,sheetf,rangeAPE)];
%             antropometria=xlsread(filename2,sheetant,rangeant);
           
%% Filtra os dados e computa o spline dos dados
%             fc=3;                                    % Frequência de corte de 3 Hz
%             [b,a]=butter(2,2*fc/freq);               % Calcula os coeficientes da equação do filtro butterworth
%             col=size(rawdata,2);                     % Computa o número de colunas de rawdata
%             colq=size(rawdataq,2);
%             colf=size(forcas,2);
%             fc2=15;
%             [b1,a1]=butter(2,2*fc2/freq);
%             spline = struct('int',cell(3,col));
%             splinef = struct('int',cell(1,colf));
%             
%             for j=1:col 
%                 filtered_raw=filtfilt(b,a,rawdata(:,j));
%                 [splineteta,splinedteta,splineddteta]=splinedata(freq,t0,tf,filtered_raw(:));      % spline do filtered_raw
%                 spline(1,j).int=splineteta;
%                 spline(2,j).int=splinedteta;
%                 spline(3,j).int=splineddteta;
%             
%             end
%             splineq=zeros(106,52);
%             splinedq=zeros(106,52);
%             for j=1:colq
%                 filteredrawq=filtfilt(b,a,rawdataq(:,j));
%                 [sq,sdq,sddq]=splinedata(freq,t0,tf,filteredrawq(1:126));      % spline do filtered_raw
%                 splineq(:,j)=ppval(sq,tempoq)';
%                 splinedq(:,j)=ppval(sdq,tempoq)';
%           
%             end
%             splineq=Expandepontos(splineq);
%             splinedq=Expandepontos(splinedq);
%             
%             
%             splinef(1,1).int=forcas(:,1);
%             splinef(1,2).int=forcas(:,1);
%             for j=3:colf
%                 filteredrawf=filtfilt(b1,a1,forcas(:,j));
%                 sf=splineforcas(freq,t0,tf,filteredrawf(1:126));
%                 splinef(1,j).int=sf;
%             end
         
    spline=load('spline.mat');
    spline=spline.spline;
    antropometria=load('antropometria.mat');
    antropometria=antropometria.antropometria;
    splineq=load('splineq.mat');
    splineq=splineq.splineq;
    splinedq=load('splinedq.mat');
    splinedq=splinedq.splinedq;
    splinef=load('splinef.mat');
    splinef=splinef.splinef;
    q0=splineq(1,:)';
    qpto0=splinedq(1,:)';
     
                
            
%% Elimina as variáveis auxiliares
    clearvars filtered_raw;
    clearvars filteredrawq;
    clearvars splineteta;
    clearvars splinedteta;
    clearvars splineddteta;
    clearvars sq;
    clearvars sdq;
    clearvars sddq;
            

end

