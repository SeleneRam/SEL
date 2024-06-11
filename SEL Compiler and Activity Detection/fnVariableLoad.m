function programa=fnVariableLoad(programa)
global estados;
global string;
nombrevariable = estados((length(estados)));
[p1, tipo,programa]=parse(programa);
if(p1=='(')
    [nombrevar,tipo,programa]=parse(programa);
    if (nombrevar=='"')
        [programa, valorvar]=fnValidarNombreArchivo(programa);
        estados((length(estados))).valor=valorvar;

    else
        fnValidarValor(nombrevar);
        id=idString(nombrevar);

        valorvar=string(1).valor;
       if(exist(valorvar))
       texto=leerprograma(valorvar);
       valoresvar=valoresLoad(texto);
         estados((length(estados))).valor=valoresvar;
     else
        error('There is no document');
     end

    end
end

[p2, tipo,programa]=parse(programa);
[fin, tipo,programa]=parse(programa);

if (p2~=')' && fin~=';')
    error('Error: Syntax ');
end
end
