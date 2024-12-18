function   [ video, temporal, actual,f]=analisisAFD(video, estados, matriz,arrayEdos, actual,f,i)
[B, video, actual,f]=fantasmas(matriz, estados, video, actual,f,i);
D=0;
temporal=[0];
    for j=1:length(estados)

        if (sum(sum(arrayEdos{j}.*B))~=0)
            temporal=[temporal, j];
              D=(arrayEdos{j}*j)+D;
        end
    end

