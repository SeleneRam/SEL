function [r,r2,lista]=analisisEtiquetas2(afdEnd,numIntrucciones, AFDEtiqueta, AFDnombres, duracion, totalFrames )
%aqui
aa=ones(1,numIntrucciones);
aaa=aa;
x=1;
r=[];
r2=[];
r3=[];
valor=[];
numero=aa;
fps=totalFrames/duracion;
lista = cell(1,numIntrucciones)
while(x~= -1  )
for j=1:numIntrucciones
    for i=aa(j):length(afdEnd{j})
        ex=afdEnd{j}(i);
        frame_duration = duracion / totalFrames;
        time_of_frame = (ex - 1) * frame_duration;
        time_string = sprintf('%.2f sec', time_of_frame);
        if (i<=length(afdEnd{j})-1 && aaa(j)~=-1)
        if (ex+1~=afdEnd{j}(i+1) )
         r=[r;AFDnombres(find(AFDEtiqueta==j))];
             aa(j)=i+1;
             r2=[r2;j];
             r3=[r3;ex];
             numero(j)=numero(j)+1;
               %disp([AFDnombres{j} '= 1-' int2str(i)]);
              lista{j} = [lista{j},",", int2str(time_string)];
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
                 %disp([AFDnombres{j} '= 2-' int2str(i)]);
                   lista{j} = [lista{j},",¡", int2str(time_string)];
             break;
         end
        if (aa(j)==length(afdEnd{j}) && aaa(j)~=-1)
             r=[r;AFDnombres(find(AFDEtiqueta==j))];
             aa(j)=aa(j)+1;
             aaa(j)=-1;
            numero(j)=numero(j)+1;
            r2=[r2;j];
             r3=[r3;ex];
            % disp([AFDnombres{j} '= 3--' int2str(i)]);
               % lista{j} = [lista{j},",*", int2str(time_string)];
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

VAR = 0;
disp("Activity count:");
itemlist = {};


for g = 1:length(aa)
    s = r2 == g;
    VAR = VAR + 25;
    resultado = sum(s) - 1;
    disp(['      ' AFDnombres{g} '=' int2str(resultado), lista{g}]);


    item_text = ['      ' AFDnombres{g} ' = **' int2str(resultado) '**    '  lista{g}];
    itemlist = [itemlist, item_text];
end


list_size = [200, max(150, VAR)];
s = listdlg("ListString", itemlist, "SelectionMode", "single", "ListSize", list_size);




