function [programa, valoresvar]=fnValidarNombreArchivo(programa)
global ts;
[nombre, tipo,programa]=parse(programa);
[punto, tipo,programa]=parse(programa);
[extension, tipo,programa]=parse(programa);
[comillas, tipo,programa]=parse(programa);

if(punto~='.' && extension~='txt' && comillas~='"')
    error('Error: wrong name');
end
valorvar= strcat(nombre,punto, extension);

if(exist(valorvar))
      texto=leerprograma(valorvar);
  valoresvar=valoresLoad(texto);
else
   error('document does not exist');
end

end
