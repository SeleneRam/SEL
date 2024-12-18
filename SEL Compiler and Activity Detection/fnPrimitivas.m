function programa = fnPrimitivas(tokenTipo, programa)
  % Definir las variables globales necesarias
  global linea;
  global primitivas;
  global AFD;
  global NG;
  global numEtiqueta;
  global cicloEtiqueta;
  global tamEstados;

  % Llamada a parse, asegurate de que esta función esté definida en Octave
  [x,~,~] = parse(programa);

  % Verificar que el primer token sea un paréntesis de apertura
  if (strcmpi(x, '(') == 0)
      error('-Error: Parenthesis- line: %d', linea);
  endif

  % Inicializar el contador de estados
  n2 = 1;

  % Procesar el token según el tipo de primitiva
  switch (tokenTipo)
      case primitivas{1}  % Primer tipo de primitiva
          AFD(NG, 1) = numEtiqueta;
          AFD(NG, 2) = cicloEtiqueta;
          AFD(NG, 3) = 1;  % Estado asociado
          NG = NG + 1;
      case primitivas{2}  % Segundo tipo de primitiva
          AFD(NG, 1) = numEtiqueta;
          AFD(NG, 2) = cicloEtiqueta;
          AFD(NG, 4) = 1;  % Estado asociado
          NG = NG + 1;
      case primitivas{3}  % Tercer tipo de primitiva
          AFD(NG, 1) = numEtiqueta;
          AFD(NG, 2) = cicloEtiqueta;
          AFD(NG, 5) = 1;  % Estado asociado
          NG = NG + 1;
  endswitch

  % Leer el siguiente token después de la primitiva
  [x,~,programa] = parse(programa);

  % Iterar mientras no se cierre el paréntesis
  while (strcmpi(x, ')') == 0)
      [variable,~,programa] = parse(programa);
      tipo2 = fnValidarValor(variable);
      % Asignar estado para la variable
      AFD(NG, 1) = numEtiqueta;
      AFD(NG, FnIDestado(variable)) = 1;  % Actualizar estado
      NG = NG + 1;
      n2 = n2 + 1;

      % Si la variable es válida, aplicar la lógica correspondiente
      if (tipo2 == 1)
          % Aquí puedes agregar más lógica si es necesario
      endif
      [x,~,programa] = parse(programa);  % Leer el siguiente token
  endwhile

  % Leer el siguiente token después del paréntesis
  [x,~,~] = parse(programa);

  % Incrementar el número de etiquetas
  numEtiqueta = numEtiqueta + 1;

  % Verificar que al menos se haya procesado un estado
  if (n2 < 2)
      error('-Error: Number of states- line: %d', linea);
  endif
endfunction

