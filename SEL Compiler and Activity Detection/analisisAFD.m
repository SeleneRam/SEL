function [video, temporal, actual, f] = analisisAFD(video, estados, matriz, arrayEdos, actual, f, i)
    % Llamada a la función 'fantasmas', asegurando que se devuelvan los valores correctos
    [B, video, actual, f] = fantasmas(matriz, estados, video, actual, f, i);

    % Inicialización de la variable D y temporal
    D = 0;
    temporal = [0];

    % Iteración sobre los estados
    for j = 1:length(estados)
        if (sum(sum(arrayEdos{j} .* B)) ~= 0)
            temporal = [temporal, j];
            D = (arrayEdos{j} * j) + D;
        end
    end
end

