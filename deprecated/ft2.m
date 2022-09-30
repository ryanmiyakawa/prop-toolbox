function G = ft2(g, delta)
if nargin == 1
   delta = 1;
end


% function G = ft2(g, delta)
    G = fftshift(fft2(fftshift(g))) * delta^2;