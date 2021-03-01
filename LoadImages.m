function [ImageMat,FileNames] = LoadImages(Path,Format)

[FileNames,Path] = GetFileNames(Path,Format);
Im0=double(imread([Path FileNames(1,:)]));
xN=size(Im0,2);
yN=size(Im0,1);
n=size(FileNames,1);
ImageMat=zeros(yN,xN,n);
f=waitbar(1/n,'Loading Images...');
for ii=1:n
    ImageMat(:,:,ii)=double(imread([Path '\' FileNames(ii,:)]));
    waitbar(ii/n,f,'Loading Images...');
end
close(f);