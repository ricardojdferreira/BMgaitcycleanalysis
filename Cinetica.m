function [ T ] = Cinetica( qptgrafico,MInercia )
%Energia Cinética
T=zeros(1,106);
for t=1:106
    T(t) =(1/2)*qptgrafico(t,53:end)*MInercia*qptgrafico(t,53:end)';

end

