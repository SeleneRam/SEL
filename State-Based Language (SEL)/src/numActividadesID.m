function n=numActividadesID(matriz, id)
n=0;
for i=1:size(matriz,1)
    if(matriz(i,1)==id)
        n=n+1;
    end
end