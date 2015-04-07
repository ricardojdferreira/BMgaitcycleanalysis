function [ Phi,Phiq,niu,gama ] = AVALTRA( nc,nh,map,q,Phi,Phiq,niu,gama )
% A função analiza as equações de guiamento de trajectória.

Pi=map(nh,2);
if map(nh,12)==0
    Ri=q(2*Pi-1); 
else
    Ri=q(2*Pi);
end
    Rj=map(nh,8);
    Phi(nh,1)=Ri-Rj;
    niu(nh,1)=map(nh,9);  
    gama(nh,1)=map(nh,10); 
    
Phiq(nh,:)=zeros(1,nc);
if map(nh,12)==0
    Phiq(nh,2*Pi-1)=1.0;
    Phiq(nh,2*Pi)=0.0;
else
    Phiq(nh,2*Pi-1)=0.0;
    Phiq(nh,2*Pi)=1.0;
end



    


