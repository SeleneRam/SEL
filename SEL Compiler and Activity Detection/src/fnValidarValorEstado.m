function fnValidarValorEstado(nombrevar)
global ts;
global pr;
x=1;
        
        for z=1:length(ts)
            xx=(ts(z).id);
            xx2=(ts(z).tipo);
            if(strcmpi(nombrevar,xx) && strcmpi('state',xx2))
                x=0;
            end
        end
        
        if(x)
              error('Error: There is no variable or type -%s-', nombrevar);
        end
        
end