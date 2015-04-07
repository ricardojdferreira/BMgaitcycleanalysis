function [ M ] = criaCR( nc,nh,ncr,map,antropometria )
%Função que cria corpos rigidos
M=zeros(nc,nh);

for i=1:ncr
 Pi=map(i,2);
 Pj=map(i,3);
% Determina as coordenadas dos pontos  
    qi = 2*Pi-1;
    qj = 2*Pj-1;
    
% Extrai os dados antropometricos da antropometria
    m  = antropometria(i,1);
    Ji = antropometria(i,2);
    xcm= antropometria(i,3);
    ycm= antropometria(i,4);
    Lij= antropometria(i,5);
    
% Determina a matriz massa
    M(qi,qi)=M(qi,qi)+m-2*m*xcm/Lij+Ji/Lij^2;
    M(qi,qi+1)=M(qi,qi+1)+0.0;
    M(qi,qj)=M(qi,qj)+m*xcm/Lij-Ji/Lij^2;
    M(qi,qj+1)=M(qi,qj+1)-m*ycm/Lij;
    M(qi+1,qi)=M(qi+1,qi)+0.0;
    M(qi+1,qi+1)=M(qi+1,qi+1)+m-2*m*xcm/Lij+Ji/Lij^2;
    M(qi+1,qj)=M(qi+1,qj)+m*ycm/Lij;
    M(qi+1,qj+1)=M(qi+1,qj+1)+m*xcm/Lij-Ji/Lij^2;
    M(qj,qi)=M(qj,qi)+m*xcm/Lij-Ji/Lij^2;
    M(qj,qi+1)=M(qj,qi+1)+m*ycm/Lij;
    M(qj,qj)=M(qj,qj)+Ji/Lij^2;
    M(qj,qj+1)=M(qj,qj+1)+0.0;
    M(qj+1,qi)=M(qj+1,qi)-m*ycm/Lij;
    M(qj+1,qi+1)=M(qj+1,qi+1)+m*xcm/Lij-Ji/Lij^2;
    M(qj+1,qj)=M(qj+1,qj)+0.0;
    M(qj+1,qj+1)=M(qj+1,qj+1)+Ji/Lij^2;
end

end

