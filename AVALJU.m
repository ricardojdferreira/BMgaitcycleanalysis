function [ Phi,Phiq,niu,gama ] = AVALJU( nc,nh,map,q,qpto,Phi,Phiq,niu,gama )
% Avalia juntas

if map(nh,12)==1
    dm=0;
else
    
    Pi=map(nh,2);
    Pj=map(nh,3);
    
    Rij=q((2*Pj-1):(2*Pj))-q((2*Pi-1):(2*Pi));
    
    Phi(nh:nh+1,1)=Rij;
    
    Phiq(nh:nh+1,(2*Pi-1):(2*Pi))=-eye(2);
    Phiq(nh:nh+1,(2*Pj-1):(2*Pj))=eye(2); 
    
    niu(nh,1)=0.0;
    
    gama(nh,1)=0.0;

end

end