function programa=fnVariables(programa)
global estados;
global string;
global pr;
global prvar;
global linea;
global arrayEdos;

[final, ~, ~]=parse(programa);
while(strcmpi(final,char(pr(2)))==0)

    [token, ~, programa]=parse(programa);
    sivar=1;
    val=0;
    for z=1:length(prvar)
        xx=char(prvar(z));
        if(strcmpi(token,xx))
            sivar=0;
            val=z;
        end
    end

    if(sivar)
        error('-Error: Invalid type -%s- line: %d', token, linea);
    end
    if (strcmpi(token,char(pr(3))~=0))
        error('-Error: -%s- line: %d', token, linea);
    end

    [nombrevar, tipo,programa]=parse(programa);
    if(tipo~='S')
        error('-Error: Invalid name -%s- line: %d', nombrevar, linea);
    end
    programa = strcat(nombrevar,programa);
    programa=fnVariableTipoOperacion(val, programa);
    [final, ~, ~]=parse(programa);
    if(strcmpi(final,'/'))
        [final, ~, ~]=parse(programa);
    end

end
end

