% William Woods
% EE 368 Final Project
% 6 June 2012

function [imagemOut infoLost] = protanopia(imagemRGB)

% This function takes the input image and creates a new output image that
% simulates what a person suffering from Deuteranopia would see.
% It converts the image from RGB (red, green, blue) to LMS (long, medium, 
% short) color space and removes the medium (M) wavelength information that
% corresponds to the patients missing "green" cones.
%
% The function also outputs a matrix containing the information that is
% lost in this process, all of the medium wavelength information.
%
% LMS conversion matricies and processing algorith found at:
% http://scien.stanford.edu/pages/labsite/2005/psych221/projects/05/ofidaner/conv_img.m

[imagemAltura imagemLargura bandas] = size(imagemRGB);
imagemLMS = zeros(size(imagemRGB));
imagemOut = zeros(size(imagemRGB));
rgbPixel = zeros(3,1);
lmsPixel = zeros(3,1);

% Matrices to convert back and forth from RGB to LMS color spaces
rgb2lms = [17.8824 43.5161 4.11935; 3.45565 27.1554 3.86714; 0.0299566 0.184309 1.46709];
% rgb2lms = [.3811 .5783 .0402; .1967 .7244 .0782; .0241 .1288 .8444];
lms2rgb = inv(rgb2lms);

% Matrix to adjust LMS image to simulate Deuteranopia, Protanope or Tritanope
proMatriz = [0 2.02344 -2.52581; 0 1 0; 0 0 1] ;


% Remove gamma-correction before manipulating image
gamma = 2.1;
imagemRGB = imagemRGB.^gamma;

for y = 1:imagemAltura
    for x = 1:imagemLargura
        % Convert input image to LMS colorspace and adjust for Deuteranopia
        rgbPixel(1:3) = imagemRGB(y,x,:); % RGB values at that pixel
        lmsPixel(1:3) = rgb2lms*rgbPixel; % LMS values at that pixel
        imagemLMS(y,x,:) = proMatriz*lmsPixel; % adjusted LMS values at that pixel
        
        % Convert image back to RGB color space
        lmsPixel(1:3) = imagemLMS(y,x,:); % grab the pixel out of final LMS image
        imagemOut(y,x,:) = lms2rgb*lmsPixel; % convert pixel back to RGB
    end % x = 1:imagemLargura
end % y = 1:imagemAltura

% Gamma-correct imageOut and imagemRGB for viewing
imagemRGB = imagemRGB.^(1/gamma);
imagemOut = imagemOut.^(1/gamma);

% Gather lost information into infoLost
infoLost = imagemRGB - imagemOut;

end %function
