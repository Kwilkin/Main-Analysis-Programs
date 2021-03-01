function [ImageMat] = RadialNorm(ImageMat,center,Mask,pixelRange)

NumIm = size(ImageMat,3);
f = waitbar(1/NumIm,'Normalizing...');
for ii = 1:NumIm
    r = SubtractRadialMean(ImageMat(:,:,ii).*Mask,center(2),center(1),-1, 10);
    Norm = sum(r(pixelRange));
    ImageMat(:,:,ii) = ImageMat(:,:,ii)/Norm;
    waitbar(ii/NumIm,f,'Normalizing...');
end
close(f)