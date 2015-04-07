function [ Phi,Phiq,niu,gama ] = AVALPE( nc,nh,map,q,qpto,Phi,Phiq,niu,gama )
%% Inicialização
Pi=map(nh,2);                                       % Índice ponto i
Pj=map(nh,3);                                       % Índice ponto j
Pk=map(nh,5);                                       % Índice ponto k
Pl=map(nh,6);                                       % Índice ponto l
Lij=map(nh,4);                                      % Comprimento Lij
Lkl=map(nh,7);                                      % Comprimento Lkl
teta=degtorad(map(nh,8));                                       % Teta em radianos
tetap=degtorad(map(nh,9));                                     % dtetadt em radianos 
tetapp=degtorad(map(nh,10));                                    % d2tetadt2 em radianos

%% Cria os vectores Rij e Rlk 
Rij=q((2*Pj-1):(2*Pj))-q((2*Pi-1):(2*Pi));                % Vector de posições Rij
Rpij=qpto((2*Pj-1):(2*Pj))-qpto((2*Pi-1):(2*Pi));         % Vector de velocidade Rpij


Rkl=q((2*Pl-1):(2*Pl))-q((2*Pk-1):(2*Pk));            % Vector de posições Rkl para quando Pl ~= -1.
Rpkl=qpto((2*Pk-1):(2*Pk))-qpto((2*Pk-1):(2*Pk));      % Vector de velocidades Rpkl para quando Pl ~= -1.

    
MR=[0 -1;1 0];                                            % Matriz de rotação de 90º
Rijtilde=MR*Rij;                                          % Vector de posição Rijtilde
Rkltilde=MR*Rkl;                                          % Vector de posição Rkltilde
Rpijtilde=MR*Rpij;                                        % Vector de velocidade Rpijtilde
    
%% Computa a linha nh da matriz dos constrangimentos Phi
Phi(nh,1)=(Rijtilde')*Rkl-Lij*Lkl*sin(teta);
    
%% Computa a linha nh dos vectores niu e gama
niu(nh,1)=Lij*Lkl*cos(teta)*tetap;
gama(nh,1)=-Lij*Lkl*(sin(teta)*tetap^2-cos(teta)*tetapp)-2*(Rpijtilde')*Rpkl; 
    
%% Computa a linha nh da jacobiana Phiq
Phiq(nh,:)=zeros(1,nc);
Phiq(nh,(2*Pi-1):2*Pi)=Rkltilde'+Phiq(nh,(2*Pi-1):(2*Pi));
Phiq(nh,(2*Pj-1):2*Pj)=-Rkltilde'+Phiq(nh,(2*Pj-1):(2*Pj));
Phiq(nh,(2*Pk-1):2*Pk)=-Rijtilde'+Phiq(nh,(2*Pk-1):(2*Pk));
Phiq(nh,(2*Pl-1):2*Pl)=Rijtilde'+Phiq(nh,(2*Pl-1):(2*Pl));

end



