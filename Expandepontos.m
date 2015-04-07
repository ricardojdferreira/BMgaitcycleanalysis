function [ M ] = Expandepontos( Mi )
%Definir juntas explicitamente
M=zeros(length(Mi(:,1)),52);
for j=1:length(Mi(:,1))
    M(j,1)=Mi(j,1);
    M(j,2)=Mi(j,2);
   
end
for j=1:length(Mi(:,1))
    M(j,3)=Mi(j,3);
    M(j,4)=Mi(j,4);
    M(j,5)=Mi(j,3);
    M(j,6)=Mi(j,4);
    M(j,7)=Mi(j,3);
    M(j,8)=Mi(j,4);
    M(j,9)=Mi(j,3);
    M(j,10)=Mi(j,4);
end
for j=1:length(Mi(:,1))
    M(j,11)=Mi(j,5);
    M(j,12)=Mi(j,6);
    M(j,13)=Mi(j,5);
    M(j,14)=Mi(j,6);
   
end
for j=1:length(Mi(:,1))
    M(j,15)=Mi(j,7);
    M(j,16)=Mi(j,8);
   
end
for j=1:length(Mi(:,1))
    M(j,17)=Mi(j,9);
    M(j,18)=Mi(j,10);
    M(j,19)=Mi(j,9);
    M(j,20)=Mi(j,10);
   
end
for j=1:length(Mi(:,1))
    M(j,21)=Mi(j,11);
    M(j,22)=Mi(j,12);
   
end
for j=1:length(Mi(:,1))
    M(j,23)=Mi(j,13);
    M(j,24)=Mi(j,14);
    M(j,25)=Mi(j,13);
    M(j,26)=Mi(j,14);
    M(j,27)=Mi(j,13);
    M(j,28)=Mi(j,14);
end
for j=1:length(Mi(:,1))
    M(j,29)=Mi(j,15);
    M(j,30)=Mi(j,16);
    M(j,31)=Mi(j,15);
    M(j,32)=Mi(j,16);
    
end
for j=1:length(Mi(:,1))
    M(j,33)=Mi(j,17);
    M(j,34)=Mi(j,18);
    M(j,35)=Mi(j,17);
    M(j,36)=Mi(j,18);
    
end
for j=1:length(Mi(:,1))
    M(j,37)=Mi(j,19);
    M(j,38)=Mi(j,20);
    
    
end
for j=1:length(Mi(:,1))
    M(j,39)=Mi(j,21);
    M(j,40)=Mi(j,22);
    
    
end
for j=1:length(Mi(:,1))
    M(j,41)=Mi(j,23);
    M(j,42)=Mi(j,24);
    M(j,43)=Mi(j,23);
    M(j,44)=Mi(j,24);
    
end
for j=1:length(Mi(:,1))
    M(j,45)=Mi(j,25);
    M(j,46)=Mi(j,26);
    M(j,47)=Mi(j,25);
    M(j,48)=Mi(j,26);
    
end
for j=1:length(Mi(:,1))
    M(j,49)=Mi(j,27);
    M(j,50)=Mi(j,28);
    
end
for j=1:length(Mi(:,1))
    M(j,51)=Mi(j,29);
    M(j,52)=Mi(j,30);
    
end

end

