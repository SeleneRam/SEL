function programa=fnVariableTipoOperacion(sivar,programa)
global estados;
global string;
global pr;
global prvar;
global linea;
[nombrevariable, tipo,programa]=parse(programa);
[puntuacion, tipo,programa]=parse(programa);

fnValidarV(nombrevariable);

variable.id=nombrevariable;
variable.tipo=char(prvar(sivar));
variable.valor=0;

[nombrevar, tipo,programa]=parse(programa);
programa = strcat(nombrevar,programa);

if (puntuacion=='=')
    [nombrevar, tipo,programa]=parse(programa);
    if (strcmpi(nombrevar,char(pr(7))))
        estados=[estados; variable];
        programa=fnVariableLoad(programa);
        variable.valor=0;
    elseif(strcmpi(nombrevar,'['))%%
        estados=[estados; variable];
        programa=fnVariablegetValores(programa);
    elseif(strcmpi(char(prvar(sivar)) ,prvar(2)) && strcmpi(nombrevar,'"'));
       [programa, valor]=fnValidarString(programa);
       variable.valor=valor;
        string =[string; variable];
    end
else
    while puntuacion~=';'
        tipovar='';
        [nombrevar, tipo,programa]=parse(programa);
        [puntuacion, tipo,programa]=parse(programa);
        if(puntuacion ~=',' && puntuacion ~=';' )
            error('-Error:  %s- line: %d ', puntuacion, linea);
        end
        f=0;
        fnValidarV(nombrevar);
        variable.id=nombrevar;
        variable.tipo=sivar;
        variable.valor=0;

        estados=[estados; variable];

    end
end


end
