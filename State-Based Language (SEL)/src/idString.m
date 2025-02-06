function id=idString(nombrevar)
global string;
id=0;
x=1;
tipo=0;


for z=1:length(string)
    xx=(string(z).id);
    if(strcmpi(nombrevar,xx))
        x=0;
        id=z;
    end
end

if(x)
    error('Error: There is no variable -%s- line: %d', nombrevar, linea);
end


end
