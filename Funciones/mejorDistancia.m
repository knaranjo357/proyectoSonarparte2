function [MatrizConfusion,randomMetal,randomRoca,Media,Std] = mejorDistancia(runs,MejorDistancia,numeroPatronesM,numeroPatronesR,sonarMetal,sonarRoca,Mt,Mv,Mte,Rt,Rv,Rte)
%MEJORDISTANCIA Summary of this function goes here
%   Detailed explanation goes here
MatrizConfusion=zeros(runs,12);
randomMetal=zeros(runs,numeroPatronesM);
randomRoca=zeros(runs,numeroPatronesR);
for i=1:runs
    [MatrizConfusion(i,:),randomMetal(i,:),randomRoca(i,:)] = parte1funcion(sonarMetal,sonarRoca,MejorDistancia,Mt,Mv,Mte,Rt,Rv,Rte);
end; clear i iteradorDistancias
ExactitudPrecision=zeros(runs,6);
    
        [ExactitudPrecision(:,1),ExactitudPrecision(:,4)] = funcionPaso2(MatrizConfusion(:,1:4))
        [ExactitudPrecision(:,2),ExactitudPrecision(:,5)] = funcionPaso2(MatrizConfusion(:,5:8))
        [ExactitudPrecision(:,3),ExactitudPrecision(:,6)] = funcionPaso2(MatrizConfusion(:,9:12))
    
Media = mean(ExactitudPrecision);
Std = std(ExactitudPrecision);

end

