function n=numActividades(matriz)
n=0;
for i=1:size(matriz,1)
    aux=n;
    if(matriz(i,1)~=aux)
        n=n+1;
    end
end