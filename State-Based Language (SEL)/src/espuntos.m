function r=espuntos(c)
r=0;
arreglo=[',' '\ ' '[' ']' ':' '"' '.' '=' '/' '%' '(' ')' '-'];
for i=1:length(arreglo)
    if(c==arreglo(i))
         r=(c==arreglo(i));
    end
end
end
