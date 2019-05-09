function [imagemOut infoLost] = deuteranopia(imagemRGB)
  
[imagemAltura imagemLargura bandas] = size(imagemRGB);
imagemLMS = zeros(size(imagemRGB));
imagemOut = zeros(size(imagemRGB));
rgbPixel = zeros(3,1);
lmsPixel = zeros(3,1);

%matriz que leva do RGB para o LMS
rgb2lms = [17.8824 43.5161 4.11935; 
           3.45565 27.1554 3.86714; 
           0.0299566 0.184309 1.46709];
           
lms2rgb = inv(rgb2lms);

%Matriz que simula a Deuteranopia
deutMatriz = [1        0 0; 
              0.494207 0 1.24827; 
              0        0 1] ;

%Remove o gamma  - correção antes da manipulação da imagem
gamma = 2.1;
imagemRGB = imagemRGB.^gamma;

for y = 1:imagemAltura
    for x = 1:imagemLargura
        % Converte a imagem para o espaço de cor LMS e ajusta para Deuteronopia
        rgbPixel(1:3) = imagemRGB(y,x,:); % Valores de dos pixel RGB
        lmsPixel(1:3) = rgb2lms*rgbPixel; % Valores do Pixel LMS
        imagemLMS(y,x,:) = deutMatriz*lmsPixel; % Aplicação da deuteranopia aos valores de LMS dos pixels
        
        % Converte a imagem para  RGB
        lmsPixel(1:3) = imagemLMS(y,x,:); % Pega os pixel da imagem do LMS
        imagemOut(y,x,:) = lms2rgb*lmsPixel; % Converte para RGB
    endfor 
endfor 

% Correção do gamma da imagem de sáida para a vizualização
imagemRGB = imagemRGB.^(1/gamma);
imagemOut = imagemOut.^(1/gamma);

% Reune as informações perdidas da imagem
infoLost = imagemRGB - imagemOut;

endfunction 
