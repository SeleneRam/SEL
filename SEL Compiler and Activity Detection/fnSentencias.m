function programa=fnSentencias(programa)
global cicloIF;
global cicloElse;
global pr; %
global estados; %
global AFD; %
global prvar;
global cicloEtiqueta;
global primitivas;%
global linea;
global tamEstados;
global NG;
global numEtiqueta;
global cicloEtiqueta;
ultima=0;
e=-100;
final=-5;
tamEstados=size(estados,1);
AFDtem=zeros(tamEstados+4,tamEstados+4);

p=programa;
[token,~,programa]=parse(programa);
[punto,~,programa]=parse(programa);
if(strcmpi(token,char(pr(2))==0) && strcmpi(punto,';')==0)
    error('-Error: -%s- linea: ', token, linea);
elseif(strcmpi(token,char('begin')))
    token=punto;
else
    programa=p;
end
l=linea;

while(strcmpi(token,pr(8))==0)
    [tokenTipo,~,programa]=parse(programa);
    tipo=fnTipoSentencia(tokenTipo);
    token=tokenTipo;
    n=1;
    if(strcmpi(tokenTipo, primitivas(1)))
        for y=1:tamEstados+4
            for yy=1:tamEstados+4
                AFDtem(y,yy)=e;
            end
        end
        %disp('secuencia');
        AFDtem(1,1)=2;
        ultima=2;
        tt=1;
    elseif (strcmpi(tokenTipo, primitivas(2)))
        for y=1:tamEstados+4
            for yy=1:tamEstados+4
                AFDtem(y,yy)=e;
            end
        end
        tt=2;
        %disp('paralelo');
        AFDtem(1,1)=3;
    elseif (strcmpi(tokenTipo, primitivas(3)))
        for y=1:tamEstados+4
            for yy=1:tamEstados+4
                AFDtem(y,yy)=e;
            end
        end
        tt=3;
        %disp('concurrencia');
        AFDtem(1,1)=4;
    end
    if(tipo==1)
        if (tt==1)
            arregloPasar=[];
            [x,~,programa]=parse(programa);
            if(strcmpi(x,'(')==0)
                error('-Error: Parenthesis- line: %d ', linea);
            end
            while(strcmpi(x,')')==0)
                [variable,~,programa]=parse(programa);
                tipo2=fnValidarValor(variable);
                ter=FnIDestado(variable);
                AFDtem(ultima,ter)=ter;
                AFDtem(ter,ter)=final;
                if (n>1)
                    AFDtem(ter,ultima)=ter;
                end
                arregloPasar=[arregloPasar ter];
                ultima=ter;
                n=n+1;
                if(tipo2==1)
                    programa=fnPrimitivas(variable,programa);
                end
                [x,~,programa]=parse(programa);
            end
            AFDtem(arregloPasar(end-1),ultima)=final;
            for h=1:length(arregloPasar)
                AFDtem(ultima,arregloPasar(h))=final;
            end

            [x,~,programa]=parse(programa);
            if(strcmpi(x,';')==0)
                error('-Error: Deliminator - line: %d ', linea);
            end
            if(n<2)
                error('-Error: Number of states- line: %d ', linea);
            end
            [token,~,~]=parse(programa);
            if(strcmpi(token,'%'))
                programa=ValorAccion(programa, 0);
                [token,~,~]=parse(programa);
            end
            AFD{numEtiqueta}=AFDtem;
            ultima=0;
            numEtiqueta=numEtiqueta+1;
        end
        if (tt==2)%paralelo
            arregloPasar=[];
            [x,~,programa]=parse(programa);
            if(strcmpi(x,'(')==0)
                error('-Error: Parenthesis- line: %d ', linea);
            end

            while(strcmpi(x,')')==0)
                [variable,~,programa]=parse(programa);
                %%checar si existe variable
                tipo2=fnValidarValor(variable);
                ter=FnIDestado(variable);
                AFDtem(3,ter)=ter;
                arregloPasar=[arregloPasar ter];
                ultima=ter;
                n=n+1;
                if(tipo2==1)
                    programa=fnPrimitivas(variable,programa);
                end
                [x,~,programa]=parse(programa);
            end
            for h=1:length(arregloPasar)
                for hh=1:length(arregloPasar)
                    AFDtem(arregloPasar(h),arregloPasar(hh))=final;
                end
            end
            [x,~,programa]=parse(programa);
            if(strcmpi(x,';')==0)
                error('-Error: Deliminator - line: %d ', linea);
            end
            if(n<2)
                error('-Error: Number of states- line: %d ', linea);
            end
            [token,~,~]=parse(programa);
            if(strcmpi(token,'%'))
                programa=ValorAccion(programa, 0);
                [token,~,~]=parse(programa);
            end
            AFDtem(ultima,ter)=final;
            AFD{numEtiqueta}=AFDtem;
            ultima=0;
            numEtiqueta=numEtiqueta+1;
        end
        if (tt==3)%conc
            [x,~,programa]=parse(programa);
            if(strcmpi(x,'(')==0)
                error('-Error: Parentesis- line: %d ', linea);
            end
            while(strcmpi(x,')')==0)
                [variable,~,programa]=parse(programa);

                tipo2=fnValidarValor(variable);
                ter=FnIDestado(variable);
                AFDtem(4,ter)=final;
                ultima=ter;
                n=n+1;
                if(tipo2==1)
                    programa=fnPrimitivas(variable,programa);
                end
                [x,~,programa]=parse(programa);
            end
            AFDtem(4,ter)=final;
            [x,~,programa]=parse(programa);
            if(strcmpi(x,';')==0)
                error('-Error: Deliminator - line: %d ', linea);
            end
            if(n<2)
                error('-Error:Number of states- line: %d ', linea);
            end
            [token,~,~]=parse(programa);
            if(strcmpi(token,'%'))
                programa=ValorAccion(programa, 0);
                [token,~,~]=parse(programa);
            end
            AFD{numEtiqueta}=AFDtem;
            ultima=0;
            numEtiqueta=numEtiqueta+1;
        end
    elseif(tipo==2)
        if(strcmpi(token,'if'))

            cicloEtiqueta=numEtiqueta;
            programa=sentenciaIf(programa);
            [token,~,~]=parse(programa);
            if(strcmpi(token,'else')&& cicloIF)
                token='end';
            end
        elseif(strcmpi(token,'while'))

            programa=sentenciaWhile(programa);
            [token,~,~]=parse(programa);
        elseif(strcmpi(token,'else') && cicloElse==0)

            programa=sentenciaElse(programa); %%falta elseif
            [token,~,~]=parse(programa);

        end

    end
end
if(cicloElse==0)
    [token,~,programa]=parse(programa);
    [punto,~,programa]=parse(programa);
    if(strcmpi(token,'end')==0 && strcmpi(punto,';')==0)
        error('-Error: -%s- line: ', token, linea);
    end
end

end
