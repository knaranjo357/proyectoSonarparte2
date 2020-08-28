function [bien,mal] = clasificarR(dataBase,MetalMedia,RocaMedia,distancia)
%CLASIFICAR Summary of this function goes here
%   Detailed explanation goes here

%1->distancia a metal
    Distancia(:,1) = pdist2(dataBase,MetalMedia,distancia);
%2->distancia a roca
    Distancia(:,2) = pdist2(dataBase,RocaMedia,distancia);
%3->salida clasificador
    Distancia(:,3) = Distancia(:,1)>Distancia(:,2);
    
    [patrones,~]=size(dataBase)
    bien=sum(Distancia(:,3))
    mal= patrones-bien
end

