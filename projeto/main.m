
clear all

imagemRGB = im2double(imread('arara.png'));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Deuteronopia

[imagemDeut error] = deuteranopia(imagemRGB);
imagemAjuste = daltonico(imagemRGB, error);
[imagemFim error2] = deuteranopia(imagemAjuste);

figure(1)
imshow(imagemRGB)
title('Imagem Original')

figure(2)
imshow(imagemDeut)
title('Como a imagem é vista pela pessoa com Deuteranopia')

figure(3)
imshow(imagemAjuste)
title('Imagem "ajustada" para o pessoa com Deuteranopia')

figure(4)
imshow(imagemFim)
title('Como a imagem "ajustada" é vista pela pessoa com Deuteranopia')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Protanopia

%
%[imagemProt error] = protanopia(imagemRGB);
%imagemAjuste = daltonico(imagemRGB, error);
%[imagemFim error2] = protanopia(imagemAjuste);
%
%figure(5)
%imshow(imagemRGB)
%title('Imagem Original')
%
%figure(6)
%imshow(imagemProt)
%title('Como a imagem é vista pela pessoa com Protanopia')
%
%figure(7)
%imshow(imagemAjuste)
%title('Imagem "ajustada" para a pessoa com Protanopia')
%
%figure(8)
%imshow(imagemFim)
%title('Como a imagem "ajustada" é vista pela pessoa com Protanopia')
%
%


