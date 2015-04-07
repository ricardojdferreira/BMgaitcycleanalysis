function [ tetasp,dtetasp,ddtetasp ] = splinedata( fa,t0,tf,rawdata )
%Função que faz spline aos dados de teta

%% Tempo de análise
tdata = (t0:1/fa:tf)'; 

%% Cria polinomios interpoladores para a funçao e suas derivadas
tetasp     = spline(tdata,rawdata(:));  % Define polinomio interpolador para um spline periodico. 
dtetasp   = mmspder(tetasp);        % Define polinomio interpolador para a 1ª derivada da funçao spline
ddtetasp = mmspder(dtetasp);        % Define polinomio interpolador para a 2ª derivada da funçao spline

%% Avalia as funçoes para os instantes t da analise
clearvars tdata         




end

