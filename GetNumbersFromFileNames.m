function [Vec,Index] = GetNumbersFromFileNames(fnMat,TextBefore,TextAfter,SortFlag)
% Input fnMat is a matix of filenames. The first dimension should be separate
% file names and the second dimension the text.
% Input TextBefore is an identifing string for text before the number.
% Input TextAfter is an identifing string for text after the number.
% Input SortFlag should be a 1 if you want the output sorted and a 0
% otherwise.
fnN=size(fnMat,1);

Vec=zeros(1,fnN);

for fni = 1:fnN
    Num=extractBetween(fnMat(fni,:),TextBefore,TextAfter);
    Vec(1,fni)=str2double(Num);
end

if SortFlag
    [Vec,Index] = sort(Vec);
else
    Index=1:fnN;
end

end

