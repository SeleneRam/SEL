function programa=fnVariablegetValores( programa)
global estados;
global linea;
global arrayEdos;
m2={};
    z=zeros(16,9);
nombrevar=estados((length(estados))).id;
[punto, tipo,programa]=parse(programa);
x=1;
programa= strcat('(',programa);
l=linea;
while ( ~(strcmpi(punto,']')))%n,n
    if( length(programa)<5)
         error('-Error: Punctuation- line: %d', l);
    end
    [par1, ~,programa]=parse(programa);
    [n1, tipo1,programa]=parse(programa);
    [coma, ~,programa]=parse(programa);
    [n2, tipo2,programa]=parse(programa);
    [par2, ~,programa]=parse(programa);
    [punto, tipo3,programa]=parse(programa);
    %%guardarlosvalores
    
    if(strcmpi(par1,'(') && strcmpi(par2,')') && strcmpi(coma,',') && strcmpi(tipo3,'P') ...
            && strcmpi(tipo1,'NE') && strcmpi(tipo2,'NE'))
        %m5=;
        m2(x) ={ strcat(n1,',',n2)};
        x=x+1;
        nn1=str2num(n1);
        nn2=str2num(n2);
        if (nn1>10 | nn1<1)
            error('-Error: %s- linea: %d\n', n1, linea);
         end
        if (nn2>17 | nn2<1)
            error('-Error: %s- linea: %d\n', n2, linea);
        end  
    
        z(nn2,nn1)=1;
        
    end
  
end


  arrayEdos{length(estados)}=z;
%%marcar los estados en la imagen y guardarlos


estados((length(estados))).valor=m2;
[punto, tipo,programa]=parse(programa);
if(punto~=';')
    error('-Error: Semicolon  linea: %d', linea);
end
end

