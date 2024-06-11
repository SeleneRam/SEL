function programa=leerprograma(name)
global nombre;

valor=strsplit(name,'\');
n=length(valor);
s=valor{n};
nombre=strsplit(valor{n},'.');


if(exist(name)~=0 && strcmpi(nombre(2),'sel') )
    fid=fopen(name,'r');
    programa=fscanf(fid,'%c');
    fclose(fid);
else
    if(strcmpi(nombre(2),'sel')==0 )
          error('-Error: Wrong extension');
    else
    end
    error('-Error: File not found %s-', name);
end
