
function [ imagemSaida ] = daltonico( imagemEntrada, infoLost )

[imagemAltura imagemLargura camadas] = size(imagemEntrada);
pixelPerdidos = zeros(3,1);
mappedLost = zeros(size(imagemEntrada));

% Matriz de mapeamento de erro 
errorMap = [0 0 0; .7 1 0; .7 0 1];

% Atribui as informações perdidas do espectro da imagem visível
for y = 1:imagemAltura
    for x = 1:imagemLargura
        pixelPerdidos(1:3) = infoLost(y,x,:);
        mappedLost(y,x,:) = errorMap*pixelPerdidos;
    endfor 
endfor 

% Adiciona o mapeamento de informações para imagem original 
imagemSaida = imagemEntrada + mappedLost;

% Certificar que os pixels da imagem de saída fiquem entre 0 e 1
imagemSaida(imagemSaida > 1) = 1;
imagemSaida(imagemSaida < 0) = 0;

endfunction
