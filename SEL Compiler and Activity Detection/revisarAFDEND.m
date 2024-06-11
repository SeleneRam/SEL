function [afdEnd]=parseAFD(afdEnd)%cadena
% afdEnd=afdEnd2;
for i=1:size(afdEnd,2)
for j=1:size(afdEnd{i},2)
 try
   if (afdEnd{i}(j)==0 && size(afdEnd{i},2)==1)

      elseif (afdEnd{i}(j)==0 && j==1 )
             afdEnd{i}=  afdEnd{i}(j+1:end)
             elseif (afdEnd{i}(j)==0)

        afdEnd{i}=  afdEnd{i}(1:j:end)
      end


 catch  ME
end
end
end


