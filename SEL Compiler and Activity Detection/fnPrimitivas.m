function programa=fnPrimitivas(tokenTipo, programa)
global linea;
global primitivas;
global AFD;
global NG;
global numEtiqueta;
global cicloEtiqueta;

global tamEstados;
[x,~,~]=parse(programa);
if(strcmpi(x,'(')==0)
    error('-Error: Parenthesis- line: %d ', linea);
end
n2=1;

if(strcmpi(tokenTipo, primitivas(1)))
    %disp('secuencia');
    AFD(NG,1)=numEtiqueta;
    AFD(NG,2)=cicloEtiqueta;
    AFD(NG,3)=1;
    NG=NG+1;
elseif (strcmpi(tokenTipo, primitivas(2)))
   % disp('paralelo');
    AFD(NG,1)=numEtiqueta;
    AFD(NG,2)=cicloEtiqueta;
    AFD(NG,4)=1;
    NG=NG+1;
elseif (strcmpi(tokenTipo, primitivas(3)))
   % disp('concurrencia');
    AFD(NG,1)=numEtiqueta;
    AFD(NG,2)=cicloEtiqueta;
    AFD(NG,5)=1;
    NG=NG+1;
end
[x,~,programa]=parse(programa);
while(strcmpi(x,')')==0)
    [variable,~,programa]=parse(programa);
    %%checar si existe variable
    tipo2=fnValidarValor(variable);
    AFD(NG,1)=numEtiqueta;
    AFD(NG,FnIDestado(variable))=1;
    NG=NG+1;
    n2=n2+1;
    if(tipo2==1)
    end
    [x,~,programa]=parse(programa);

end
[x,~,~]=parse(programa);
numEtiqueta=numEtiqueta+1;
if(n2<2)
    error('-Error: Number of states- line: %d ', linea);
end
end
