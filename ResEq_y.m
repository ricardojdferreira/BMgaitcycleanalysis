function [ dy_dt ] = ResEq_y( t,y,nc,nh,map,Phi,Phiq,niu,gama,alfa,beta,M,g,spline,splinef)
%Resolve as equa��es de movimento, para o ypt ser integrado pelo ode45

%% Transforma��o do vector y em q & qpt (vector coluna!)
waitbar((t-0.1)/1.05)
q   = y(1:nc,1);
qpto= y(nc+1:end,1);

%% Faz avalia��o de Phi, dPhidq, niu e gama
for i=1:14
    map(38+i,8:10)=[ppval(spline(1,i).int,t) ppval(spline(2,i).int,t) ppval(spline(3,i).int,t)]; %Vai buscar os tetas aos splines no tempo em quest�o
end

[Phi,Phiq,niu,gama] = FAZAVAL(nc,nh,map,q,qpto,Phi,Phiq, niu,gama);

g=GRF_Grav(q,map,t,splinef,g); %aplica as reaccoes do ch�o �s for�as grav�ticas

%% Resolu��o do qptpt atrav�s do sistema Ax=b
gamacorrigido=gama-2*alfa*(Phiq*qpto-niu)-(beta^2)*Phi;

b=[g; gamacorrigido];

A=[M Phiq';Phiq zeros(nc,nh)];


%% Resolu��o do sistema
x=pinv(A)*b;

%Obter qpt e construir a solu��o do sistema dydt
qptopto=x(1:nc);
dy_dt=[qpto; qptopto];


end

