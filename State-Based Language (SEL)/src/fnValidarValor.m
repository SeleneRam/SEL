function tipo=fnValidarValor( nombrevar)
global estados;
global string;
global pr2;
global primitivas;
global linea;
x=1;
tipo=0;
for z=1:length(pr2)
    xx=char(pr2(z));
    if(strcmpi(nombrevar,xx))
        error('Error: similar name-%s- line: %d', nombrevar, linea);
    end
end

for z=1:length(estados)
    xx=(estados(z).id);
    if(strcmpi(nombrevar,xx))
        x=0;
    end
end

for z=1:length(string)
    xx=(string(z).id);
    if(strcmpi(nombrevar,xx))
        x=0;
    end
end


for z=1:length(primitivas)
    xx=char(primitivas(z));
    if(strcmpi(nombrevar,xx))
       x=0;
       tipo=1;
    end
end


if(x)
    error('Error:There is no variable-%s- line: %d', nombrevar, linea);
end

end