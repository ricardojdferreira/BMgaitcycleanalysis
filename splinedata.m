function [ tetasp,dtetasp,ddtetasp ] = splinedata( fa,t0,tf,rawdata )
%Fun��o que faz spline aos dados de teta

%% Tempo de an�lise
tdata = (t0:1/fa:tf)'; 

%% Cria polinomios interpoladores para a fun�ao e suas derivadas
tetasp     = spline(tdata,rawdata(:));  % Define polinomio interpolador para um spline periodico. 
dtetasp   = mmspder(tetasp);        % Define polinomio interpolador para a 1� derivada da fun�ao spline
ddtetasp = mmspder(dtetasp);        % Define polinomio interpolador para a 2� derivada da fun�ao spline

%% Avalia as fun�oes para os instantes t da analise
clearvars tdata         




end

