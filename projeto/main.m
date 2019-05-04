
clear all

imagemRGB = im2double(imread('candy.png'));

%[imagemDeut error] = deuteranopia(imagemRGB);
%imagemAjuste = daltonico(imagemRGB, error);
%[imagemFim error2] = deuteranopia(imagemAjuste);
%
%figure(1)
%imshow(imagemRGB)
%title('Original Image')
%
%figure(2)
%imshow(imagemDeut)
%title('Image as seen by Deuteranopia Patient')
%
%figure(3)
%imshow(imagemAjuste)
%title('Image adjusted for Deuteranopia Patient')
%
%figure(4)
%imshow(imagemFim)
%title('Adjusted image as seen by Deuteranopia Patient')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%[imagemProt error] = protanopia(imagemRGB);
%imagemAjuste = daltonico(imagemRGB, error);
%[imagemFim error2] = protanopia(imagemAjuste);
%
%figure(5)
%imshow(imagemRGB)
%title('Original Image')
%
%figure(6)
%imshow(imagemProt)
%title('Image as seen by Protanopia Patient')
%
%figure(7)
%imshow(imagemAjuste)
%title('Image adjusted for Protanopia Patient')
%
%figure(8)
%imshow(imagemFim)
%title('Adjusted image as seen by Protanopia Patient')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[imagemTri error] = tritanopia(imagemRGB);
imagemAjuste = daltonico(imagemRGB, error);
[imagemFim error2] = tritanopia(imagemAjuste);

figure(9)
imshow(imagemRGB)
title('Original Image')

figure(10)
imshow(imagemTri)
title('Image as seen by Tritanopia Patient')

figure(11)
imshow(imagemAjuste)
title('Image adjusted for tritanopia Patient')

figure(12)
imshow(imagemFim)
title('Adjusted image as seen by tritanopia Patient')
