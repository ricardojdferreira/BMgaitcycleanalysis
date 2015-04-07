function [ forcassp ] = splineforcas( fa,t0,tf,rawdata )
%Fun��o que faz spline aos dados de teta

%% Tempo de an�lise
tdata = (t0:1/fa:tf)'; 

%% Cria polinomios interpoladores para a fun�ao
forcassp     = spline(tdata,rawdata(:));  % Define polinomio interpolador para um spline periodico.

%% Avalia as fun�oes para os instantes t da analise
clearvars tdata         




end

