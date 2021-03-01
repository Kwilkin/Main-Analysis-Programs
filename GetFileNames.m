function [FileNames,Path] = GetFileNames(Path,format);

if nargin < 2 || isempty(format)
    format = 'tif*';
end

if Path(end)=='\'
    Path=Path;
elseif ischar(Path)
    Path=[Path '\'];
else
    
end

if strcmp(format(1),'.')
    format=['*' format];
else
    format=['*.' format];
end

FileNames = ls([Path format]);