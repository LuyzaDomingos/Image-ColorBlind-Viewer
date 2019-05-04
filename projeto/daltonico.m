% William Woods
% EE 368 Final Project
% 6 June 2012

function [ imagemSaida ] = daltonico( imagemEntrada, infoLost )

% This function performs daltonization on the input image. Daltonization
% uses the information removed from the original image during the process
% of simulating color blindness and maps it to frequencies visible to the
% color blind viewer. This process uses and error mapping matrix to perform
% this color assignment.
%
% ***imagemEntrada and infoLost must be the same size***

[imagemAltura imagemLargura camadas] = size(imagemEntrada);
pixelPerdidos = zeros(3,1);
mappedLost = zeros(size(imagemEntrada));

% Error mapping matrix
errorMap = [0 0 0; .7 1 0; .7 0 1];

% Assign lost information to visible spectrum
for y = 1:imagemAltura
    for x = 1:imagemLargura
        pixelPerdidos(1:3) = infoLost(y,x,:);
        mappedLost(y,x,:) = errorMap*pixelPerdidos;
    end % x = 1:imagemLargura
end % y = 1: imagemAltura

% Add mapped info to original input image
imagemSaida = imagemEntrada + mappedLost;

% Ensure output image pixel values fall within [0 1]
imagemSaida(imagemSaida > 1) = 1;
imagemSaida(imagemSaida < 0) = 0;

end
