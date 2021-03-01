function [F] = FFT2DImage(Image,ds);

sz = size(Image);

NFFTY = 2^nextpow2(sz(1));
NFFTX = 2^nextpow2(sz(2));

Fs = 1/ds*pi;

spatialFreqsX = Fs*linspace(0,1,NFFTX/2+1);
spatialFreqsY = Fs*linspace(-1,0,NFFTY/2+1);

% G = exp(-0.03.*CF3I.smap.^2);  % Image should be dampened before putting
% in here
F = fft2(Image,NFFTY,NFFTX);
F = abs(fftshift(F));
figure;imagesc(spatialFreqsX,spatialFreqsY,F(1:NFFTY/2+1,NFFTY/2+1:end))