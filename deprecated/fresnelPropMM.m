% 6/17/2007  Ryan Miyakawa 
% 
% function output =
%               fresnelPropMM(aperture, apsize, outres, outsize,  ...
%               z_mm, wavelength_nm, ccdx, ccdy)
% 
% PREVIOUSLY PROP10


function output = fresnelPropMM(aperture,apsize,outres,outsize,z_mm,wavelength_nm, ccdx, ccdy)

if length(outsize) == 1
    outx = outsize;
    outy = outsize;
else
    outx = outsize(2);
    outy = outsize(1);
end
if length(apsize) == 1
    apx = apsize;
    apy = apsize;
else
    apx = apsize(2);
    apy = apsize(1);
end
if length(outres) == 1
    outresx = outres;
    outresy = outres;
else
    outresx = outres(2);
    outresy = outres(1);
end


%generates aperture coordinates
[apresy, apresx] = size(aperture); %but ap must be square
indx = linspace(-apx/2, apx/2,apresx); 
indy = linspace(-apy/2, apy/2, apresy);
[xsi,eta] = meshgrid(indx,indy);

zl = z_mm*wavelength_nm; % lambda*z in um^2

%transform kernel
h = exp(1i*pi/(zl)*(xsi.^2 + eta.^2)); %Fresnel diffraction (default)


clear xsi eta;
%generates observation coordinates
out_indx = linspace(-outx/2 + ccdx, outx/2 + ccdx, outresx);
out_indy = linspace(-outy/2 - ccdy, outy/2 - ccdy, outresy);
[xout,yout] = meshgrid(out_indx,out_indy);


O = exp(1i*pi/(zl)*(xout.^2 + yout.^2))/(1i*zl); %propagate to a plane

clear xout yout;

%fourier matrices
fx = exp((-2i*pi/(zl)) * indx.' *out_indx); 
fy = exp((-2i*pi/(zl)) * indy.' *out_indy); 
clear ind out_ind;
output = O.*((fy.')*(h.*aperture)*fx);


