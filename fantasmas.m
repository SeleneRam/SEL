    function [B, video, actual, f] = fantasmas(matriz, estados, video, anterior, f, i)
    S = zeros(1000, 1);
    e = strel('square', 5);
    k = 1;
    B = 0;
    % i=1;
    movbanterior = f;

    # Variable que controla el threshold de la funcion equivalente a imbinarize
    global im2bwThreshold = 0.5;

    n = 1;
    prueba = [];
    actual = double(rgb2gray(readFrame(video)));
    actual = imresize(actual, .30);
    mov = actual - anterior;
    de = std(mov(:)); %desviacion estandar

    movactual = double((abs(mov) > de * 1));
    f = k * movactual + (1 - k) * movbanterior;


    if (de > 2)

        %          imwrite(f,['fantasmas c1\\v_' int2str(i) '.png']);
        B = imresize(f, [16 9]);

        B = double(im2bw(B, im2bwThreshold));
        #B = double(imbinarize(B));

        imagenes{n} = B;

    else
        r = zeros(size(f));
        B = imresize(r, [16 9]);
        B = double(im2bw(B, im2bwThreshold));
        imagenes{n} = B;
    end
