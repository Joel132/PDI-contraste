function r = AMBE(img, img2) 
%El error absoluto del brillo
% recibe la imagen original y la imagen de salida

imgBr = mean2(img);
img2Br = mean2(img2);

r = abs(imgBr - img2Br);

