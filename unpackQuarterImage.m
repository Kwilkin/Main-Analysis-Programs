function [I] = unpackQuarterImage(QI,UseStandardSize);
%% Rebuilds a quartered image.
% Inputs:
% QI: 2nd quadrant quarter of an image
% UseStandardSize: 0 or 1.
% 0 means you use the whole image
% 1 means you use a standard size (useful for combining images)

szY=size(QI,1);
szX=size(QI,2);

I = zeros(2*szY-1,2*szX-1);

% |1|2|
% |3|4|
if UseStandardSize
    SS = 500; % SS -> Standard size
    szY=size(QI,1);
    szX=size(QI,2);
    if (szY < SS || szX < SS)
        error('Change your Standard Size.')
    end
    I = zeros(2*SS-1,2*SS-1);
    QI = QI(szY-SS+1:end,1:SS);
    
    I(1:SS,1:SS) = fliplr(QI); % q1
    I(1:SS,SS:end) = QI; % q2
    I(SS:end,1:SS) = rot90(QI,2); % q3
    I(SS:end,SS:end) = flipud(QI);
else
    szY=size(QI,1);
    szX=size(QI,2);
    
    I = zeros(2*szY-1,2*szX-1);
    
    I(1:szY,1:szX) = fliplr(QI); % q1
    I(1:szY,szX:end) = QI; % q2
    I(szY:end,1:szX) = rot90(QI,2); % q3
    I(szY:end,szX:end) = flipud(QI);
end