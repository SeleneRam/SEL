clc;
clear;

% Definir los elementos de la lista
lista = {'Elemento 1', 'Elemento 2', 'Elemento 3', 'Elemento 4', 'Elemento 5'};

% Mostrar la ventana de selección
[indice, seleccionado] = listdlg('ListString', lista, ...
                                 'SelectionMode', 'single', ...
                                 'PromptString', 'Selecciona un elemento:', ...
                                 'Name', 'Lista de elementos', ...
                                 'ListSize', [300, 150]);

% Verificar si se seleccionó algo
if seleccionado
    fprintf('Seleccionaste: %s\n', lista{indice});
else
    fprintf('No seleccionaste ningún elemento.\n');
end

