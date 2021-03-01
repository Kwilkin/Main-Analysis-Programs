function [DataMat,SPV,Index,NumImPerPoint] = LoadTimeScanImages(Path,Average)
%% Load images saved with the time scan from Data Acquisition app I made.
% Path should be string to the folder with the images
% Average is a 0 or a 1. 
% 0 for all the images to be loaded seperately (large memory footprint).
% 1 for the same stage positions to be averaged together. 

[ImageMat,FileNames] = LoadImages(Path,'tiff');
[StagePosiVec,~] = GetNumbersFromFileNames(FileNames,'Pos_','_Curr',0);

[SPV,~,Index] = unique(StagePosiVec);
NumImPerPoint = length(StagePosiVec)/length(SPV);
sz = size(ImageMat);
if Average
    DataMat = zeros(sz(1),sz(2),max(Index));
else
    DataMat = zeros(sz(1),sz(2),max(Index),length(Index)/max(Index));
end

for ii = 1:max(Index)
    if Average
        DataMat(:,:,ii) = mean(ImageMat(:,:,Index == ii),3);
    else
        DataMat(:,:,ii,:) = ImageMat(:,:,Index == ii);
    end
end