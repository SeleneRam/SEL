
clc all
clear all
close all
pkg load video;
pkg load image;

prompt = {'SEL SCRIPT NAME:'};
dlgtitle = 'S E L';
fieldsize = [1 40];
inputdlgdefinput={''};
answer = inputdlg(prompt,dlgtitle,fieldsize,inputdlgdefinput);

val=answer{1,1};
variable=true;
while (variable)

    n = 1;
    i = 0;

    [AFD, AFDnombres, AFDEtiqueta, estados, arrayEdos, videoname] = principal(val);
    videoname;
    video = VideoReader(videoname);
    matriz = AFD;
    actual = double(rgb2gray(readFrame(video)));
    numIntrucciones = (length(matriz));
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
   while (hasFrame(video))

        [video, temporal, actual, f] = analisisAFD(video, estados, matriz, arrayEdos, actual, f, i);
        videoP = video;
        afd2{n} = temporal;
        n = n + 1;

        if (mod(n,100)==1)
      porcentaje=  n*100/video.NumberOfFrames;
          disp(["   W O R K I N G. . . "  int2str(porcentaje) '%']);
        end


    end

    afdEnd = [];

    afd2 = afd2(2:end);
     for xx=1:numIntrucciones
        frames=parseAFD2(AFD{xx},afd2);
        frames=[frames 0];
         afdEnd{xx}=frames;
     end

     [rr, rr2]=analisisEtiquetas2(afdEnd,numIntrucciones, AFDEtiqueta, AFDnombres);
    %
    %
variable=false;

end
