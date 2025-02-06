function r=esdelimitador(c)
  %r=(c==32 || c==59 );
  c=double(c);
  r=(c==' '||c==8 || c==10 || c==13|| c==11 );
end