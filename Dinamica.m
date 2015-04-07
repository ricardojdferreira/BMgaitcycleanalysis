function [Momentos_ang,Massa,M,spline,antropometria,y,splinef,gjuntas] = Dinamica(ghost)

tic;
%Dimensoes do Problema 
dimProb(1)=52; %nr de coordenadas
dimProb(2)=52; %nr de constrangimentos
dimProb(3)=12; %nr de corpos rigidos
dimProb(4)=26; %nr de pontos
dimProb(5)=16; %nr de constrangimentos produto interno (corpo rigido)

global alfa
global beta

Massa=77.8;
alfa = 50;
beta=50;

q = zeros(dimProb(1),1); 
qp = zeros(dimProb(1),1); 
qpp = zeros(dimProb(1),1); 
Phi = zeros(dimProb(2),1); 
niu = zeros(dimProb(2),1); 
gama = zeros(dimProb(2),1); 
Phiq = zeros(dimProb(2),dimProb(1));
g = zeros(dimProb(1),1); 
lambda = zeros(dimProb(2),1); 


map=zeros(dimProb(2),12);

    
%Comprimentos dos membros
L31=0.3258499559; %Pescoço
L62=0.3665542163;% mudamos aqui braco direito
L78=0.2679055072; %
L94=0.3834144111; % mudamos aqui braco esquerdo
L1011=0.2547225226;%
L135=0.529513464; %
L1215=0.4336716427;
L1617=0.4235413072;%
L1819=0.0875398022; % feito com o ankle lateral
L2018=0.1360489584; %
L1920=0.1463021823; %
L1421=0.4279352794;
L2223=0.4259131051; %
L2425=0.0741268375; % feito com o ankle lateral
L2624=0.1344442331; %
L2526=0.142998704; %
L13X=1;

[spline,antropometria,splineq,q0,qpto0,splinef]=datateta();


q0=q0.*10^-3;
qpto0=qpto0.*10^-3;
y0=[q0 ;qpto0];

%% Equações de corpo rígido
map(1,:)=[1 1 3 L31 1 3 L31 0.0 0.0 0.0 0 0]; %Cabeça e pescoço
map(2,:)=[1 2 6 L62 2 6 L62 0.0 0.0 0.0 0 0]; %Braço Direito
map(3,:)=[1 7 8 L78 7 8 L78 0.0 0.0 0.0 0 0]; %Antebraço Direito
map(4,:)=[1 4 9 L94 4 9 L94 0.0 0.0 0.0 0 0]; %Braço Esquerdo
map(5,:)=[1 10 11 L1011 10 11 L1011 0.0 0.0 0.0 0 0]; % Antebraço Esquerdo
map(6,:)=[1 5 13 L135 5 13 L135 0.0 0.0 0.0 0 0]; %Tronco
map(7,:)=[1 12 15 L1215 12 15 L1215 0.0 0.0 0.0 0 0];%Coxa Direita
map(8,:)=[1 16 17 L1617 16 17 L1617 0.0 0.0 0.0 0 0];%Perna Direita
map(9,:)=[1 19 20 L1920 19 20 L1920 0.0 0.0 0.0 0 0];%Planta do pé Direito
map(10,:)=[1 14 21 L1421 14 21 L1421 0.0 0.0 0.0 0 0];%Coxa Esquerda
map(11,:)=[1 22 23 L2223 22 23 L2223 0.0 0.0 0.0 0 0];%Perna Esquerda
map(12,:)=[1 25 26 L2526 25 26 L2526 0.0 0.0 0.0 0 0];%Planta do pé Esquerdo

map(13,:)=[1 18 19 L1819 18 19 L1819 0.0 0.0 0.0 0 0];%Calcanhar Direito
map(14,:)=[1 20 18 L2018 20 18 L2018 0.0 0.0 0.0 0 0];%Peito do pé Direito
map(15,:)=[1 24 25 L2425 24 25 L2425 0.0 0.0 0.0 0 0];%Calcanhar Esquerdo
map(16,:)=[1 26 24 L2624 26 24 L2624 0.0 0.0 0.0 0 0];% Peito do pé Esquerdo

%Equações de junta
map(17,:)=[3 3 5 0 3 5 0 0.0 0.0 0.0 0 0];%Pescoço/tronco: em x
map(18,:)=[3 3 5 0 3 5 0 0.0 0.0 0.0 0 1];% em y
map(19,:)=[3 2 3 0 2 3 0 0.0 0.0 0.0 0 0];%Ombro Direito: em x
map(20,:)=[3 2 3 0 2 3 0 0.0 0.0 0.0 0 1];% em y
map(21,:)=[3 4 3 0 4 3 0 0.0 0.0 0.0 0 0];%Ombro Esquerdo: em x
map(22,:)=[3 4 3 0 4 3 0 0.0 0.0 0.0 0 1];% em y
map(23,:)=[3 7 6 0 7 6 0 0.0 0.0 0.0 0 0];%Antebraço direito/Braço direito: em x
map(24,:)=[3 7 6 0 7 6 0 0.0 0.0 0.0 0 1];% em y
map(25,:)=[3 10 9 0 10 9 0 0.0 0.0 0.0 0 0];%Antebraço esquerdo/braço esquerdo: em x
map(26,:)=[3 10 9 0 10 9 0 0.0 0.0 0.0 0 1];% em y
map(27,:)=[3 12 13 0 12 13 0 0.0 0.0 0.0 0 0];%Coxa Direita/Tronco: em x
map(28,:)=[3 12 13 0 12 13 0 0.0 0.0 0.0 0 1];%em y
map(29,:)=[3 14 13 0 14 13 0 0.0 0.0 0.0 0 0];%Coxa Esquerda/Tronco: em x
map(30,:)=[3 13 14 0 13 14 0 0.0 0.0 0.0 0 1];% em y
map(31,:)=[3 16 15 0 16 15 0 0.0 0.0 0.0 0 0];%Perna Direit/Coxa direita: em x
map(32,:)=[3 16 15 0 16 15 0 0.0 0.0 0.0 0 1];% em y
map(33,:)=[3 22 21 0 22 21 0 0.0 0.0 0.0 0 0];%Perna Esquera/Coxa Esquerda: em x
map(34,:)=[3 22 21 0 22 21 0 0.0 0.0 0.0 0 1];% em y
map(35,:)=[3 18 17 0 18 17 0 0.0 0.0 0.0 0 0];%Calcanhar Direito/Perna Direita: em x
map(36,:)=[3 18 17 0 18 17 0 0.0 0.0 0.0 0 1];%em y
map(37,:)=[3 24 23 0 24 23 0 0.0 0.0 0.0 0 0];%Calcanhar Esquerdo/Perna Esquerda:em x
map(38,:)=[3 24 23 0 24 23 0 0.0 0.0 0.0 0 1];% em y

%Equacoes de Guiamento Angular
  map(39,:)=[2 3 1 L31 5 13 L135 0 0 0 0 0];% Pescoço/Tronco PE
  map(40,:)=[2 3 1 L31 2 6 L62 0 0 0  0 0];% Pescoço/BraçoDireito PE
  map(41,:)=[2 3 1 L31 4 9 L94 0 0 0 0 0];% Pescoço/BraçoEsquerdo PE
  map(42,:)=[2 6 2 L62 7 8 L78 0 0 0 0 0];%Braço/Antebraço Direito PE
  map(43,:)=[2 9 4 L94 10 11 L1011 0 0 0 0 0];%Braço/Antebraço Esquerdo PE
  map(44,:)=[1 13 5 L135 0 -1 L13X 0 0 0 0 0];%Tronco/Trajectoria PI
  map(45,:)=[2 13 5 L135 12 15 L1215 0 0 0 0 0];%Tronco/Perna Direita PE
  map(46,:)=[2 13 5 L135 14 21 L1421 0 0 0 0 0];%Tronco/Perna Esquerda PE
  map(47,:)=[2 15 12 L1215 16 17 L1617 0 0 0 0 0];%Coxa direita/Perna Direita PE
  map(48,:)=[2 21 14 L1421 22 23 L2223 0 0 0 0 0];%Coxa Esquerda/Perna Esquerda PE
  map(49,:)=[1 17 16 L1617 18 20 L2018 0 0 0 0 0];%Perna Direita/Planta do pé Direita PI
  map(50,:)=[1 23 22 L2223 24 26 L2624 0 0 0 0 0];%Perna Esquerda/Planta do pé Esquerda PI
  
  %Equações de Trajectória
  map(51,:)=[4 13 0 0 0 0 0  0 0 0 0 0];%Trajéctoria em xx
  map(52,:)=[4 13 0 0 0 0 0  0 0 0 0 1];%Trajéctoria em yy  
  
  %% Computa a matriz das massas globais
M = criaCR(dimProb(1),dimProb(2),dimProb(3),map,antropometria);

%% Forças gravíticas
grf_grav=zeros(dimProb(1),1);
for i=1:dimProb(3)
    qi=2*map(i,2)-1;
       qj=2*map(i,3)-1;
       coordgen=ConstroiC(antropometria,i)'*[0;-9.8*antropometria(i,1)];
       grf_grav(qi:qi+1,1)=grf_grav(qi:qi+1,1)+coordgen(1:2);
       grf_grav(qj:qj+1,1)=grf_grav(qj:qj+1,1)+coordgen(3:4);
end

%% Angulos a partir dos Splines
for i=1:14
    map(38+i,8:10)=[ppval(spline(1,i).int,0.1) ppval(spline(2,i).int,0.1) ppval(spline(3,i).int,0.1)]; %Respectivamente teta, tetapto, tetaptopto
end

[Phi,Phiq,niu,gama] = FAZAVAL(dimProb(1),dimProb(2),map,q0,qpto0,Phi,Phiq, niu,gama); %Faz a avaliação para o instante inicial

t=(0.1:0.01:1.15); %tempo a começar em 0.1 pois começa-se no frame 11 para descartar os primeiros 10 


h=waitbar(0,'Please wait');
hw=findobj(h,'Type','Patch');
set(hw,'EdgeColor',[0 0 0],'FaceColor',[0 0.5 0]) % changes the color to green

%% Inicio da analise com ODE's
[tint,y]=ode45(@ResEq_y,t,y0,[],dimProb(1),dimProb(2),map,Phi,Phiq,niu,gama,alfa,beta,M,grf_grav,spline,splinef); %integrador
close(h);


Mqptopto=zeros(dimProb(1),length(tint)); %Matriz com acelerações ao longo do tempo
Mlambda=zeros(dimProb(2),length(tint));   % Matriz com lambdas ao longo do tempo  

for i=1:length(tint)
    [Mqptopto(:,i),Mlambda(:,i)]=ResEq_qptpt_lambda(tint(i),y(i,:)',dimProb(1),dimProb(2),map,Phi,Phiq,niu,gama,alfa,beta,M,grf_grav,spline,splinef );
end

%% Forcas de juntas
gjuntas=zeros(44,length(tint)); %4 forcas por cada junta(forca em x e y para o primeiro e segundo ponto do corpo)
Momentos_ang=zeros(24,106); %momentos dos angulos (2*nº de constragimentos angulares(12))
Il=eye(2);

for i=1:length(tint)
    for j=1:11 %numero de juntas
        gjuntas(4*j-3:4*j,i)=[-Il;Il]*Mlambda((2*j-1)+dimProb(5):2*j+dimProb(5),i);
    end
    for k=1:2:24
        pos=(k+1)/2 + 38;
        if map(pos,1)==1
        Momentos_ang(k,i)=Mlambda(pos,i)*map(pos,4)*map(pos,7)*sind(ppval(spline(1,(k+1)/2).int,tint(i))); %cálculo dos momentos para constrangimentos de produto interno
        else
        Momentos_ang(k,i)=Mlambda(pos,i)*map(pos,4)*map(pos,7)*cosd(ppval(spline(1,(k+1)/2).int,tint(i)));% Produto externo
        end
        Momentos_ang(k+1,i)=-Momentos_ang(k,i);
    end
    spq=splineq';
    PlotStickman(y(i,1:dimProb(1))',y(i,dimProb(1)+1:end)',Mqptopto(:,i),spq(:,i),ghost); %desenha os pontos a cada instante temporal
    
end 
toc;
close all
