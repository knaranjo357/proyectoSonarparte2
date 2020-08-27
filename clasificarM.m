function [bien,mal] = clasificarM(dataBase,MetalMedia,RocaMedia,distancia)
%CLASIFICAR Summary of this function goes here
%   Detailed explanation goes here

%1->distancia a metal
    Distancia(:,1) = pdist2(dataBase,MetalMedia,distancia);
%2->distancia a roca
    Distancia(:,2) = pdist2(dataBase,RocaMedia,distancia);
%3->salida clasificador
    Distancia(:,3) = Distancia(:,1)<Distancia(:,2);
    
    bien=sum(Distancia(:,3))
    
    [patrones,~]=size(dataBase) %~ significa que no quiero guardar
    mal= patrones-bien
end 

