function [frames]=parseAFD2(matriztransicion, texto)%cadena
tipo='';
frames=[];
e=-100;
final=-5;
edoanterior=e;
tipo=0;
tama=0;
siz=length(texto);
i=1;
nn=1;
m=matriztransicion;
estado=1;
inicio=1;
es=[];
fn=0;
edoz=0;
estado=matriztransicion(1, 1);
tipo=estado-1;
estado=1;
while(length(texto)>=1)
    if (inicio==1 && estado~=e)
        if(fn==1)
            [valor x c]=fun2(i, texto{1}, tipo);
            edoz=matriztransicion( edoanterior, valor+4);
        end
        if(edoz~=final &&   edoz~=e && tipo==1) % && edoz~=e
            inicio=3;
            estado=matriztransicion(estado, 1);
            
        end
        if(edoz~=final && tipo==2) % && edoz~=e
            inicio=3;
            estado=matriztransicion(estado, 1);
            
        end
        if(edoz~=final && tipo==3 ) % && edoz~=e
            inicio=3;
            estado=matriztransicion(estado, 1);
            
        end
    end
    if (edoz==final)
        estado=1;
        fn=1;
        inicio=1;
        %disp('secuencia w');
        frames=[frames i];
        if (x~=-1)
            i=i+1;
            atras=texto{1};
            texto=texto(2:end);
        else
            texto{1}=c;
        end
    else
        edoanterior=estado;
        [valor x c]=fun2(i, texto{1}, tipo);
        estado=matriztransicion( edoanterior, valor+4);
        %matriztransicion(edoanterior, (texto{1}+4))=e;
        if(estado~=e || estado~=final )
            %token=strcat(token, texto{1});
            es=[es i];
            if (x~=-1)
                i=i+1;
                atras=texto{1};
                texto=texto(2:end);
            else
                texto{1}=c;
            end
        end
        
        if (tipo==1)
            an=es(1);
            if(length(es)>1)
                for ss=2:length(es)
                    if(an==es(ss))
                        estado=e;
                        es=[];
                    else
                        an=es(ss);
                    end
                    
                end
            end
        end
        if(tipo==3)
            tama = length(find(matriztransicion==final));
        end
        if(estado==final)
            %edoanterior=estado;
            estado=1;
            fn=1;
            inicio=1;
            %seg=atras;
            % disp('secuencia');
             frames=[frames es];
        end
        if(estado==e)
            if (estado==e && x==-1)
                es=es(1:end-1);
                estado=edoanterior;
            else
                %edoanterior=estado;
                estado=1;
                fn=0;
                es=[];
                inicio=1;
            end
        end
    end
end

if (tipo==3)
     for w=1:length(frames)-1
        if (frames(w)>frames(w+1))
        
            frames(w+1)=0;
        end
    end
    aux=[];
    
    for w=1:siz
        t=length(find(frames==w));
        if(t>=tama)
            aux=[aux w];
        end
    end
    frames=aux;
end

if (tipo==2)
   
    
    aux=[];
    for w=1:siz
        t=length(find(frames==w));
        if(t>=1)
            aux=[aux w];
        end
    end
    frames=aux;
end

