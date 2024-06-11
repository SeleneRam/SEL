function [r,r2]=analisisEtiquetas2(afdEnd,numIntrucciones, AFDEtiqueta, AFDnombres)
aa=ones(1,numIntrucciones);
aaa=aa;
x=1;
r=[];
r2=[];
r3=[];
valor=[];
numero=aa;
while(x~= -1  )
for j=1:numIntrucciones
    for i=aa(j):length(afdEnd{j})
        ex=afdEnd{j}(i);
        if (i<=length(afdEnd{j})-1 && aaa(j)~=-1)
        if (ex+1~=afdEnd{j}(i+1) )
         r=[r;AFDnombres(find(AFDEtiqueta==j))];
             aa(j)=i+1;
             r2=[r2;j];
             r3=[r3;ex];
             numero(j)=numero(j)+1;
               % disp([AFDnombres{j} '= ' int2str(i)]);
             break;
        end
        end
         if (length(afdEnd{j})-1==1 && aaa(j)~=-1)
         r=[r;AFDnombres(find(AFDEtiqueta==j))];
             aa(j)=i+1;
             aaa(j)=-1;
             numero(j)=numero(j)+1;
             r2=[r2;j];
              r3=[r3;ex];
                % disp([AFDnombres{j} '= ' int2str(i)]);
             break;
         end
        if (aa(j)==length(afdEnd{j}) && aaa(j)~=-1)
             r=[r;AFDnombres(find(AFDEtiqueta==j))];
             aa(j)=aa(j)+1;
             aaa(j)=-1;
            numero(j)=numero(j)+1;
            r2=[r2;j];
             r3=[r3;ex];
             %disp([AFDnombres{j} '= ' int2str(i)]);
             break
         end
    end
end
suma=0;
   for g=1:length(afdEnd)
   if(aaa(g)==-1)
   suma=suma+1;
   end
   end
   suma;
   if(suma==length(afdEnd))
  % disp(suma);
   break;
   end
end
suma;

for x=1:length(AFDnombres)

for y=1:length(r3)

  if (strcmp (AFDnombres{x},r{y})==1)
   %disp([r{y} ': ' int2str(r3(y))]);
  end

end

end
disp("Activity count:");
itemlist={};
for g=1:length(aa)
    s=r2==g;
    resultado=sum(s)-1;
    disp(['      ' AFDnombres{g} '=' int2str(resultado)]);
   %itemlist = {itemlist,['      ' AFDnombres{g} '=' int2str(resultado)]};
   itemlist = [itemlist,['      ' AFDnombres{g} '=' int2str(resultado)]];
end
%itemlist = itemlist(1:end);

 s = listdlg ("ListString", itemlist,"SelectionMode","single");




