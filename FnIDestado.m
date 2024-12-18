function id = FnIDestado(name)
  global estados;
  global tamEstados;
  global linea;

  id = 0;
  tipo = 0;

  if (strcmpi(name, 'seq'))
      id = 1;
      tipo = 1;
  elseif (strcmpi(name, 'par'))
      id = 2;
      tipo = 1;
  elseif (strcmpi(name, 'con'))
      id = 3;
      tipo = 1;
  elseif (strcmpi(name, '&'))
      id = 4;
      tipo = -1;
  elseif (strcmpi(name, '|'))
      id = 5;
      tipo = -1;
  elseif (strcmpi(name, '!'))
      id = 6;
      tipo = -1;
  end

  for z = 1:tamEstados
      xx = (estados(z).id);
      if (strcmpi(name, xx))
          id = z;
      end
  end

  if (id == 0)
      error('Error: Invalid state name -%s- line: %d', name, linea);
  end

  if (tipo == 0)
      id = id + 4;
  end
end

