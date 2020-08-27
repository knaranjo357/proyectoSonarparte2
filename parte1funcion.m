function [salidaa,salidab,salidac] = parte1funcion(baseDatosC1,baseDatosC2,distancia,tM,vM,teM,tR,vR,teR)
%PARTE1FUNCION Summary of this function goes here
%   Detailed explanation goes here
MetalRand=randperm(tM+vM+teM)
RocaRand=randperm(tR+vR+teR)
    
%separar training validation test Metal
MetalTraining = baseDatosC1(MetalRand(1:67),:)
MetalValidation = baseDatosC1(MetalRand(68:89),:)
MetalTest = baseDatosC1(MetalRand(90:111),:)

%separar training validation test Roca
RocaTraining = baseDatosC2(RocaRand(1:59),:)
RocaValidation = baseDatosC2(RocaRand(60:78),:)
RocaTest = baseDatosC2(RocaRand(79:97),:)

%modelo de clasificacion IMPORTANTE SOLO PARA TRAINING
MetalMedia= mean (MetalTraining(:,1:60))
RocaMedia= mean (RocaTraining(:,1:60))

[bienMetalTraining,malMetalTraining] = clasificarM(MetalTraining(:,1:60),MetalMedia,RocaMedia,distancia)
[bienMetalValidation,malMetalValidation] = clasificarM(MetalValidation(:,1:60),MetalMedia,RocaMedia,distancia)
[bienMetalTest,malMetalTest] = clasificarM(MetalTest(:,1:60),MetalMedia,RocaMedia,distancia)


[bienRocaTraining,malRocaTraining] = clasificarR(RocaTraining(:,1:60),MetalMedia,RocaMedia,distancia)
[bienRocaValidation,malRocavalidation] = clasificarR(RocaValidation(:,1:60),MetalMedia,RocaMedia,distancia)
[bienRocaTest,malRocaTest] = clasificarR(RocaTest(:,1:60),MetalMedia,RocaMedia,distancia)


salidaa=[bienMetalTraining, malMetalTraining, bienRocaTraining, malRocaTraining, ...
            bienMetalValidation,malMetalValidation, bienRocaValidation,malRocavalidation,...
            bienMetalTest,malMetalTest, bienRocaTest,malRocaTest]
salidab=MetalRand
salidac=RocaRand
end

