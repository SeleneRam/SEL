function [token tipo texto]=parse(texto)%cadena
tipo='';
token='';
atras='';
e=-100;
global linea;
e2=-101;
f=[1 2 3 4 5 6 7 8 9];
edoanterior=e;
matriztransicion=[
    2,3,e,4,f(5),e,1,9,9,9;... %1
    2,2,2,e,e,e,f(2),e,e,e;...%2
    e,f(3),e,e,e,6,f(3),e,e,e;...%3
    e,e,e,e,e,e,f(4),e,e,e;...%4
    e,e,e,e,e,e,e,e,e,e;...%5
    e,7,e,e,e,e,f(6),e,e,e;...%6
    e,7,e,e,e,e,f(6),e,e,e;...%7
    e,e,e,e,e,e,f(7),e,e,e;...%8
    %%%
    e2,e2,e2,e2,e2,e2,e2,e2,f(8),10;...%9
    e2,e2,e2,e2,e2,e2,f(8),e2,e2,e2;];%10
v=0;
estado=1;
if(texto(1)==59)
     linea=linea+1;
     token=texto(1);
     texto=texto(2:end);
     tipo='FIN';
     v=1;
elseif(texto(1)==10 || texto(1)==11)
     token='vacios';
     texto=texto(2:end);
     tipo='FIN';
     v=1;
end
while(estado~=e && estado~=e2 && estado>0 && ~isempty(texto) && texto(1)~=32 && fun(texto(1))~=-10 && v==0 )
    %&& texto(1)~=10  && texto(1)~=8 && texto(1)~=13 && texto(1)~=11 )
    if(fun(texto(1))==-10  )
        estado=-10;
    else
        edoanterior=estado;
        estado=matriztransicion(estado, fun(texto(1)));

        if(estado~=e && estado~=e2  )
            token=strcat(token, texto(1));
            atras=texto(1);
            texto=texto(2:end);
        end
    end
end



if(estado==e || estado==e2)
    %fprintf('Error: %s',texto(1));
    estado=edoanterior;
end

if(estado>0 )
    if(estado==2)
        %fprintf('\nTipo: Cadena');
        %tipo='ID';
        tipo='S';
    elseif(estado==3)
        %fprintf	('\nTipo: Numero Entero');
        tipo='NE';
        % tipo='F';
    elseif(estado==6)
        %fprintf	('\nTipo: Numero Decimal');
        tipo='ND';
        % tipo='F';
    elseif(estado==4)
        %fprintf	('\nTipo: Punto');
        tipo='P';
    elseif(estado==5)
        tipo='O';
        %fprintf	('\nTipo: Operador');
    elseif(estado==8)
        tipo='E';
        %fprintf	('\nTipo: Expresion');
    end
end
% if(texto(1)==';')
%     tipo='FIN';
% end
if (~isempty(texto))
    if (texto(1)==32)
        texto=texto(2:end);
    elseif(strcmpi(token,'vacios'))
        [token,tipo,texto]=parse(texto);
    elseif(strcmpi(token,10))
         texto=texto(2:end);
    end
end
if(strcmpi(token,'/'))
    token2=texto(1);
    if( strcmpi(token2,'/'))
         texto=comentarios(texto);
          [token,tipo,texto]=parse(texto);
    end
end

end

