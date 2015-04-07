function [ forcassp ] = splineforcas( fa,t0,tf,rawdata )
%Função que faz spline aos dados de teta

%% Tempo de análise
tdata = (t0:1/fa:tf)'; 

%% Cria polinomios interpoladores para a funçao
forcassp     = spline(tdata,rawdata(:));  % Define polinomio interpolador para um spline periodico.

%% Avalia as funçoes para os instantes t da analise
clearvars tdata         




end

