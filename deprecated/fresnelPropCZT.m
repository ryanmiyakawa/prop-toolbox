function [x2, y2, Uout] = fresnelPropCZT(Uin, wvl, d1, d2, N2, Dz)
% function [x2 y2 Uout] = fresnelPropCZT(Uin, wvl, d1, d2, N2, Dz)
%
% Computes Fresnel diffraction integral via chrip z-transform

N = size(Uin, 1); % assume square grid
k = 2*pi/wvl; % optical wavevector
% source-plane coordinates

idx = linspace(-N/2 * d1, N/2 * d1, N);

%[x1 y1] = meshgrid((-N/2 : 1 : N/2 - 1) * d1); % observation-plane coordinates
[x1, y1] = meshgrid(idx, idx);

% intrinsic d2:
d2i = wvl*Dz/(N*d1);

% phase equivalent:
d2p = 2*pi*d2/(d2i*N);

startAngle = exp(1i *(N2/2 * d2p));

chirpedZT = czt(...
        czt(Uin.* exp(1i * k/(2*Dz) ...
        * (x1.^2 + y1.^2)), N2, exp(1i*d2p), startAngle).',...
        N2, exp(1i*d2p), startAngle).';


idx2 = linspace(-N2/2 * d1, N2/2 * d1, N2);
%[x2 y2] = meshgrid((-N2/2 : N2/2-1) * d2);
[x2, y2] = meshgrid(idx2, idx2);
% evaluate the Fresnel-Kirchhoff integral 
Uout = 1 / (1i*wvl*Dz) ...
    .* exp(1i * k/(2*Dz) * (x2.^2 + y2.^2)) ... 
    .* chirpedZT;