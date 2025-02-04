function [B, video, actual, f] = fantasmas(matriz, estados, video, anterior, f, i)
  k = 1;
  movbanterior = f;
  n = 1;
pkg load image

    global im2bwThreshold =.5;

    n = 1;

  actual = double(rgb2gray(readFrame(video)));


  actual = imresize(actual, 0.30);


  mov = actual - anterior;
  de = std(mov(:));

  movactual = double(abs(mov) > de * 1);

  f = k * movactual + (1 - k) * movbanterior;



  if (de > 2)
    B = imresize(f, [ 16 9]);

    B = B > im2bwThreshold;
  else
    r = zeros(size(f));  %
    B = imresize(r, [16 9]);
    B = B > im2bwThreshold;
  endif

end
