function [accuracy,precision] = funcionPaso2(dataBase)
%FUNCIONPASO2 Summary of this function goes here
%   Detailed explanation goes here

bienMetal=dataBase(:,1)
bienRoca=dataBase(:,3)
malMetal=dataBase(:,2)
malRoca=dataBase(:,4)

accuracy=(bienMetal+bienRoca)./(bienMetal+bienRoca+malMetal+malRoca)
precision=(bienMetal)./(bienMetal+malMetal)
end

