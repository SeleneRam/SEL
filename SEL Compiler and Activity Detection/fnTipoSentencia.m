function tipo=fnTipoSentencia(nombrevar)
global primitivas;
global ciclos;
global linea;
x=0;
tipo=0;
for z=1:length(primitivas)
    xx=char(primitivas(z));
    if(strcmpi(nombrevar,xx))
       x=1;
       tipo=1;
    end
end

for z=1:length(ciclos)
    xx=char(ciclos(z));
    if(strcmpi(nombrevar,xx))
       x=1;
       tipo=2;
    end
end

if (x~=1)
     error('Error: Invalid name -%s-  line: %d', nombrevar, linea);
end
    

end