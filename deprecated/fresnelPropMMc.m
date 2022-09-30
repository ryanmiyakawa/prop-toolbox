% 6/17/2007  Ryan Miyakawa 
% 
% function output =
%               fresnelPropMMc(aperture,apsize (um), outCoordX (um),
%               outCoordY (um), z_mm,wavelength_nm)
% 
% Computes fresnel diffraction via matrix multiplication (Fourier series
% sum).  This version the "custom" version whereby the coordinates of
% output are given explicitly as inputs.  This allows for unusual
% propagations that do not necessarily have evenly spaced output grids.
%
% Since grid will not necessarily be rectangular, we can't take advantage
% of KG's Fy*U*Fx trick.  



function output = fresnelPropMMc(aperture,apsize, outCoordX, outCoordY,z_mm,wavelength_nm)

[oSr, oSc] = size(outCoordX);
% Vectorize
outCoordX = outCoordX(:);
outCoordY = outCoordY(:);

if length(apsize) == 1
    apx = apsize;
    apy = apsize;
else
    apx = apsize(1);
    apy = apsize(2);
end


%generates aperture coordinates
[apresy, apresx] = size(aperture); %but ap must be square
indx = linspace(-apx/2, apx/2,apresx); 
indy = linspace(-apy/2, apy/2, apresy);
[xsi,eta] = meshgrid(indx,indy);

xsi = xsi(:);
eta = eta(:);

zl = z_mm*wavelength_nm; % lambda*z in um^2

%transform kernel
h = exp(1i*pi/(zl)*(xsi.^2 + eta.^2)); %Fresnel diffraction (default)


clear xsi eta;
%generates observation coordinates

FT = exp(-2i*pi/zl * (indx.' * outCoordX + indy.' * outCoordY));


O = exp(1i*pi/(zl)*(outCoordX.^2 + outCoordY.^2))/(1i*zl); %propagate to a plane


output = O.*((fy.')*(h.*aperture)*fx);


