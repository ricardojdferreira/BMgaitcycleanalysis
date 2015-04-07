function [C] = ConstroiC(antropometria,n)
% ConstroiC recebe a matriz antropometria e um n relativo a um corpo
% rigido, realizando a matriz C de mudan�a de coordenadas

%% Comprimento do corpo r�gido
Lij=antropometria(n,5)*10^-3;

%% Matrix X1
X1=eye(2)/Lij;

%% Coordenadas X e Y do centro de massa
ripl=[antropometria(n,3)*10^-3 antropometria(n,4)*10^-3];

%% C�lculo dos coeficientes c1 e c2 no referencial do corpo r�gido
c=X1*ripl';
C=[1-c(1) c(2)   c(1) -c(2);
   -c(2)  1-c(1) c(2) c(1)];

end
