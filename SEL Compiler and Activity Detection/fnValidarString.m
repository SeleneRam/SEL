function [programa, valor]=fnValidarString(programa)
global string;
global estado;
[nombre, tipo1,programa]=parse(programa);
[comillas, tipo,programa]=parse(programa);
[extension, tipo,programa]=parse(programa);
[comillas2, tipo,programa]=parse(programa);
[punto, tipo,programa]=parse(programa);
if( tipo1~='S' && comillas~='.' && extension~=';' && comillas2~='"' && punto~=';')
    error('Error: wrong name');
end

valor = strcat(nombre,'.', extension);



end
