function [Phi,Phiq,niu,gama] = FAZAVAL(nc,nh,map,q,qpto,Phi,Phiq, niu,gama)
%Faz avaliação das equações dependendo do tipo de constragimento
for i=1:nh
    switch map(i,1)
        
        case 1 
         [Phi,Phiq,niu,gama]=AVALPI(nc,i,map,q,qpto,Phi,Phiq,niu,gama);   
        case 2
         [Phi,Phiq,niu,gama]=AVALPE(nc,i,map,q,qpto,Phi,Phiq,niu,gama);  
        case 3
         [Phi,Phiq,niu,gama]=AVALJU(nc,i,map,q,qpto,Phi,Phiq,niu,gama);
        case 4
          [Phi,Phiq,niu,gama]=AVALTRA(nc,i,map,q,Phi,Phiq,niu,gama);
    end
end
end