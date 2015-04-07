function [ grf_grav ] = GRF_Grav( q,map,t,splinef,g )
%GRF_Grav adiciona às forças de reacção do chão as forças graviticas

antrotODE = zeros(2,5);% Valores da antropometria para um tempo especifico e já em coordenadas locais
grf_grav=g;
%atropometria no tempo da ODE 

for i=1:2
    if i==1
%% Pé direito
LD = map(9,4);      %Tamanho da planta do pé
Pi = 2*map(9,2)-1;  %Coordenada x de i
Pj = 2*map(9,3)-1;  %Coordenada x de j
Xtil = eye(2)/LD;
X = zeros(2,2); %Ir ao vector q buscar as coordenadas
    X(1,1) = q(Pj)-q(Pi);
    X(1,2) = -(q(Pj+1)-q(Pi+1));
    X(2,1) = q(Pj+1)-q(Pi+1);
    X(2,2) = X(1,1);
A = X*Xtil;
antrotODE(1,1) = ppval(splinef(1,3).int,t); %força em x coordenadas locais
antrotODE(1,2) = ppval(splinef(1,4).int,t); %força em y coordenadas locais
antrotODE(1,3:4)= (pinv(A)*([ppval(splinef(1,5).int,t);ppval(splinef(1,6).int,t)]-q(Pi:Pi+1)))';
antrotODE(1,5) = LD;
    else
%% Pé esquerdo
LE = map(12,4);      %Tamanho da planta do pé
Pi = 2*map(12,2)-1;  %Coordenada x de i
Pj = 2*map(12,3)-1;  %Coordenada x de j

%% Realização da matriz A para calculo dos CoP's das coordenadas generalizadas para locais
Xtil = eye(2)/LD;
X = zeros(2,2); %Ir ao vector q buscar as coordenadas
    X(1,1) = q(Pj)-q(Pi);
    X(1,2) = -(q(Pj+1)-q(Pi+1));
    X(2,1) = q(Pj+1)-q(Pi+1);
    X(2,2) = X(1,1);
    A = X*Xtil;

%% Devolve valores antropometricos para um dado instante, com os CoP's em coordenadas locais
antrotODE(2,1) = ppval(splinef(1,7).int,t); %força em x coordenadas locais
antrotODE(2,2) = ppval(splinef(1,8).int,t); %força em y coordenadas locais
antrotODE(2,3:4)= (pinv(A)*([ppval(splinef(1,9).int,t);ppval(splinef(1,10).int,t)]-q(Pi:Pi+1)))';
antrotODE(2,5) = LE;

    end

        forca=ConstroiC(antrotODE,i)'*antrotODE(i,1:2)';
        grf_grav(Pi:Pi+1,1)=g(Pi:Pi+1,1)+forca(1:2);
        grf_grav(Pj:Pj+1,1)=g(Pj:Pj+1,1)+forca(3:4);


end

