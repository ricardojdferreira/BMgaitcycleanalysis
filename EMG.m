function [ emgraw ] = EMG(  )
%Importa os dados de EMG

emgraw=csvread('DADOSEMG.csv',5,1);
t=1:length(emgraw);
spline1=spline(t,emgraw(:,1));
spline2=spline(t,emgraw(:,2));
spline3=spline(t,emgraw(:,3));
spline4=spline(t,emgraw(:,4));
t2=1:0.01:length(emgraw); %Foi feito para se ter mais dados e ter um grafico mais smooth
emgraw=[ppval(spline1,t2)' ppval(spline2,t2)' ppval(spline3,t2)' ppval(spline4,t2)'];
end

