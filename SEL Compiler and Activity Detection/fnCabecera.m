function [programa, videoname]=fnCabecera(programa)
global pr;
global nombre;
global linea;

[token, tipo, programa]=parse(programa);


if (strcmpi(token,char(pr(1)))==0)%module
    error('-Error: -%s- line:%d', token, linea);
end

[tokenname,tipo,programa]=parse(programa);

fnValidarV(tokenname);
if(strcmpi(tipo,'S')==0 )
    error('-Error: -%s- line:%d', tokenname, linea);
end
[token,tipo,programa]=parse(programa);

if(strcmpi(token,';')==0)
    error('-Error: -%s- --> ";" line:%d', token, linea);
end
if(strcmpi(tokenname,nombre)==0)
    error('-Error: file name -%s-  line:%d', tokenname, linea);
end
[token, tipo, programa]=parse(programa);

if (strcmpi(token,'export')==0)%export
    error('-Error: -%s- line:%d', token, linea);
end

videoname="";
valor='?';
nombre="";
[comillas, tipo, programa]=parse(programa);


while(strcmpi(valor,'.')!=1)
  [name, tipo, programa]=parse(programa);
  nombre=strcat (nombre,name);
  valor=name;
 end

punto=valor;
[extension, tipo, programa]=parse(programa);
[comillas2, tipo, programa]=parse(programa);
texto=strcat (nombre, extension);



if(strcmpi(comillas,'"')==0)
  error('-Error: -%s- line:%d', comillas, linea);
end

if(strcmpi(punto,'.')==0)
  error('-Error: -%s- line:%d', punto, linea);
end

if(strcmpi(comillas2,'"')==0)
 error('-Error: -%s- line:%d', comillas2, linea);
end
[token, tipo, programa]=parse(programa);
if(strcmpi(token,';')==0)
 error('-Error: -%s- line:%d', comillas2, linea);
end
videoname=texto;
[token,~,~]=parse(programa);
if(strcmpi(token,'%'))
    %disp('string de valor guardarlo con la etiqueta');
    programa=ValorAccion(programa, 1);
end
end
