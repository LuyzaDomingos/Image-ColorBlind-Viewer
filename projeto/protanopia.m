% Possui o mesmo objetivo que a função de Deuteronopia. Mudando apenas a matriz que simula o tipo de daltonismo

function [imagemOut infoLost] = protanopia(imagemRGB)
  
[imagemAltura imagemLargura bandas] = size(imagemRGB);
imagemLMS = zeros(size(imagemRGB));
imagemOut = zeros(size(imagemRGB));
rgbPixel = zeros(3,1);
lmsPixel = zeros(3,1);

rgb2lms = [17.8824 43.5161 4.11935; 
           3.45565 27.1554 3.86714; 
           0.0299566 0.184309 1.46709];
lms2rgb = inv(rgb2lms);

%Matriz que simula a Protanopia
proMatriz = [0 2.02344 -2.52581; 0 1 0; 0 0 1] ;


gamma = 2.1;
imagemRGB = imagemRGB.^gamma;

for y = 1:imagemAltura
    for x = 1:imagemLargura
        
        rgbPixel(1:3) = imagemRGB(y,x,:); 
        lmsPixel(1:3) = rgb2lms*rgbPixel; 
        imagemLMS(y,x,:) = proMatriz*lmsPixel;
        
     
        lmsPixel(1:3) = imagemLMS(y,x,:); 
        imagemOut(y,x,:) = lms2rgb*lmsPixel; 
    endfor 
endfor


imagemRGB = imagemRGB.^(1/gamma);
imagemOut = imagemOut.^(1/gamma);

infoLost = imagemRGB - imagemOut;

endfunction