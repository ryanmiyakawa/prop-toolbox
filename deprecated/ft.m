function G = ft(g, delta)
if nargin == 1
    delta = 1;
end

% function G = ft(g, delta)
    G = fftshift(fft(fftshift(g))) * delta;