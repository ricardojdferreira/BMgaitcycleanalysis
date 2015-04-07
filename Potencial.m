function [ V ] = Potencial( q,antropometria )
%Computa a energia potencial para o sistema multicorpo



%%Cria matriz C para o sistema multibody
for i = 1:2:23
Cmultibody(i:i+1,:) = ConstroiC(antropometria,(i+1)/2);
end

ag=[0; -9.81];
V=zeros(1,106);


for t=1:106
    V(1,t)=-antropometria(1,1)*[q(t,1:2)'; q(t,5:6)']'*Cmultibody(1:2,:)'*ag; %Cabeça
V(1,t)=V(1,t)-antropometria(2,1)*[q(t,3:4)'; q(t,11:12)']'*Cmultibody(3:4,:)'*ag; %Braço direito
V(1,t)=V(1,t)-antropometria(3,1)*[q(t,13:14)'; q(t,15:16)']'*Cmultibody(5:6,:)'*ag; %Antebraço D
V(1,t)=V(1,t)-antropometria(4,1)*[q(t,7:8)'; q(t,17:18)']'*Cmultibody(7:8,:)'*ag; %BraçoE
V(1,t)=V(1,t)-antropometria(5,1)*[q(t,19:20)'; q(t,21:22)']'*Cmultibody(9:10,:)'*ag; %Antebra E
V(1,t)=V(1,t)-antropometria(6,1)*[q(t,9:10)'; q(t,25:26)']'*Cmultibody(11:12,:)'*ag; %Tronco
V(1,t)=V(1,t)-antropometria(7,1)*[q(t,23:24)'; q(t,29:30)']'*Cmultibody(13:14,:)'*ag; %Coxa D
V(1,t)=V(1,t)-antropometria(8,1)*[q(t,31:32)'; q(t,33:34)']'*Cmultibody(15:16,:)'*ag; %perna D
V(1,t)=V(1,t)-antropometria(9,1)*[q(t,37:38)'; q(t,39:40)']'*Cmultibody(17:18,:)'*ag; %planta pe d
V(1,t)=V(1,t)-antropometria(10,1)*[q(t,27:28)'; q(t,41:42)']'*Cmultibody(19:20,:)'*ag;%coxa E
V(1,t)=V(1,t)-antropometria(11,1)*[q(t,43:44)'; q(t,45:46)']'*Cmultibody(21:22,:)'*ag;%perna E
V(1,t)=V(1,t)-antropometria(12,1)*[q(t,49:50)'; q(t,51:52)']'*Cmultibody(23:24,:)'*ag;%planta do pé E
end




end

