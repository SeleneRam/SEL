% -*- octave -*-
clc;
clear all;
close all;
warning("off", "all");
pkg load video;
pkg load image;

prompt = {'SEL SCRIPT NAME:'};
dlgtitle = 'S E L';
fieldsize = [1 15];
inputdlgdefinput = {''};
answer = inputdlg(prompt, dlgtitle, fieldsize, inputdlgdefinput);
duracion = 0;
val = answer{1, 1};
val;
totalFrames = 0;
variable = true;
result = strsplit(val, ".sel");

if length(result) > 1
    % Extraer el nombre antes de ".sel"
    nombre = result{1};%The format must be [name].sel');
end
 while (variable)
    n = 1;
    i = 0;

    [AFD, AFDnombres, AFDEtiqueta, estados, arrayEdos, videoname,nombrep] = principal(val);
    video = VideoReader(videoname);
    matriz = AFD;
    actual = double(rgb2gray(readFrame(video)));
    numIntrucciones = length(matriz);
    n = 1;
    afd2 = {};
    actual = double(rgb2gray(readFrame(video)));
    actual = imresize(actual, .30);
    actual = zeros(size(actual));
    f = ones(size(actual));
    ORIGINAL = readFrame(video);
    actual = double(rgb2gray(readFrame(video)));
    actual = imresize(actual, .30);

    disp("   W O R K I N G. . . 0%");

    h = waitbar(0, 'W O R K I N G. . .');
    total = video.NumberOfFrames;
    duracion = video.Duration;
    totalFrames = video.NumberOfFrames;

    while (hasFrame(video))
        [video, temporal, actual, f] = analisisAFD(video, estados, matriz, arrayEdos, actual, f, i);
        videoP = video;
        afd2{n} = temporal;
        n = n + 1;

        if (mod(n, 50) == 1)
            porcentaje = n * 100 / total;
            disp(["   W O R K I N G. . . " int2str(porcentaje) '%']);
            waitbar(n / total, h, sprintf('W O R K I N G. . . %d%%', round((n / total) * 100)));
        end
    end

    close(h);

    afdEnd = [];
    afd2 = afd2(2:end);

    for xx = 1:numIntrucciones
        frames = parseAFD(AFD{xx}, afd2);
        frames = [frames 0];
        afdEnd{xx} = frames;
    end

    [r, r2, lista] = analisisEtiquetas(afdEnd, numIntrucciones, AFDEtiqueta, AFDnombres, duracion, totalFrames,nombrep);
    [r, r2, lista] = analisisEtiquetas(afdEnd, numIntrucciones, AFDEtiqueta, AFDnombres, duracion, totalFrames,nombrep);
    variable = false;
end

