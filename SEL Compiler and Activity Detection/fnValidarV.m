function fnValidarV(nombrevar)
global ts;
global pr;
global linea;
   for z=1:length(pr)
            xx=char(pr(z));
            if(strcmpi(nombrevar,xx))
                error('Error: similar name -%s-  line: %d', nombrevar, linea);
            end
        end
        
        for z=1:length(ts)
            xx=(ts(z).id);
            if(strcmpi(nombrevar,xx))
                error('Error: existing variable -%s- line %d', nombrevar, linea);
            end
        end
end