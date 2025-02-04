function edos=valoresEdos(matriz)
edos=[];
n=0;
aux=0;
id=0;
for i=1:size(matriz,1)
    aux=id;
    id=matriz(i,1);
    if(matriz(i,1)~=aux)
        n=0;
    end
    k  = find(matriz(i,:)==1);
    if (k~=0)
        k=k(end)-8;
        if(k>=1)
            edos(id,n)=k;
        end
        n=n+1;
    end
end
            