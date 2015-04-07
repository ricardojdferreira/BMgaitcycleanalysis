function [ qptopto, lambda ] = ResEq_qptpt_lambda( t_ode,y,nc,nh,map,Phi,Phiq,niu,gama,alfa,beta,M,g,spline,splinef )
%Resolve as equações de movimento, para resolver qptpt e lambda nos tempos
%obtidos do ode45

%% Transformação do vector y em q & qpt (vector coluna!)
q   = y(1:nc,1);
qpto= y(nc+1:length(y),1);

%% Faz avaliação de Phi, dPhidq, niu e gama
for i=1:14
    map(38+i,8:10)=[ppval(spline(1,i).int,t_ode) ppval(spline(2,i).int,t_ode) ppval(spline(3,i).int,t_ode)];
end

[Phi,Phiq,niu,gama] = FAZAVAL(nc,nh,map,q,qpto,Phi,Phiq, niu,gama);

g=GRF_Grav(q,map,t_ode,splinef,g);

%% Resolução do qptpt através do sistema Ax=b
gamacorrigido=(gama-2*alfa*(Phiq*qpto-niu)-beta^2*Phi);
b=[g; gamacorrigido];

A=[M Phiq';Phiq zeros(nc,nh)];


%% Resolução do sistema
x=pinv(A)*b;

%Obter qptpt e lambda (para os tempos do ode45)
qptopto=x(1:nc);
lambda=x(nc+1:nc+nh);



end

