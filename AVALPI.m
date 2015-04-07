function [ Phi,Phiq,niu,gama ] = AVALPI( nc,nh,map,q,qpto,Phi,Phiq,niu,gama )
%% Inicialização
Pi=map(nh,2);                                       % Índice ponto i
Pj=map(nh,3);                                       % Índice ponto j
Pk=map(nh,5);                                       % Índice ponto k
Pl=map(nh,6);                                       % Índice ponto l
Lij=map(nh,4);                                      % Comprimento Lij
Lkl=map(nh,7);                                      % Comprimento Lkl
teta=degtorad(map(nh,8));                                       % Teta
tetap=degtorad(map(nh,9));                                     % dtetadt
tetapp=degtorad(map(nh,10));                                    % d2tetadt2
 
%% Cria os vectores Rij e Rlk 
Rij=q((2*Pj-1):(2*Pj))-q((2*Pi-1):(2*Pi));                % Vector de posição Rij
Rpij=qpto((2*Pj-1):(2*Pj))-qpto((2*Pi-1):(2*Pi));         % Vector de velocidade Rpij
if map(nh,6)==-1
    Rkl=[1 ;0];
    Rpkl=[0; 0];
else
Rkl=q((2*Pl-1):(2*Pl))-q((2*Pk-1):(2*Pk));            % Vector de posição Rkl quando Pl ~= -1.
Rpkl=qpto((2*Pl-1):(2*Pl))-qpto((2*Pk-1):(2*Pk));     % vector de velocidades Rpkl quando Pl ~= -1.
end
%% Computa a linha nh da matriz dos constrangimentos Phi
Phi(nh,1)= dot(Rij,Rkl)-Lij*Lkl*cos(teta);

    
%% Linha da jacobiana
Phiq(nh,:)=zeros(1,nc);
Phiq(nh,(2*Pi-1):(2*Pi))=-Rkl'+Phiq(nh,(2*Pi-1):(2*Pi));
Phiq(nh,(2*Pj-1):(2*Pj))=Rkl'+Phiq(nh,(2*Pj-1):(2*Pj));
if map(nh,6)~=-1
Phiq(nh,(2*Pk-1):(2*Pk))=-Rij'+Phiq(nh,(2*Pk-1):(2*Pk));
Phiq(nh,(2*Pl-1):(2*Pl))=Rij'+Phiq(nh,(2*Pl-1):(2*Pl));
end

    
%% vector niu
niu(nh,1)=-Lij*Lkl*sin(teta)*tetap;
%% vector gama
gama(nh,1)=-Lij*Lkl*(cos(teta)*tetap^2+sin(teta)*tetapp)-2*dot(Rpij,Rpkl);
end



