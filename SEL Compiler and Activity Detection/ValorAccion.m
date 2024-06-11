function programa=ValorAccion(programa, ciclo)
global linea;
global NG;
global AFD;
global tamEstados;
global numEtiqueta;
global AFDnombres;
global AFDnombresNum;
global AFDEtiqueta;
global cicloEtiqueta;

l=linea;
resultado=0;
[x,~,programa]=parse(programa);
valor.info='';
v={};
valor.etiqueta='';
[x,~,programa]=parse(programa);
while(strcmpi(x,';')==0)
    v = horzcat(v,x);
   [x,~,programa]=parse(programa);

end
if (ciclo==1)
    AFDEtiqueta(AFDnombresNum)=cicloEtiqueta;
else
    AFDEtiqueta(AFDnombresNum)=numEtiqueta;
end
str=strjoin(v);
AFDnombres(AFDnombresNum)={str};
AFDnombresNum=AFDnombresNum+1;
end
