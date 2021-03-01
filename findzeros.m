% find all zeros indeces of a function sM, only one input is necessary %
function [n0]=findzeros(sM,s_int)

if nargin==1 
    s_int=1:length(sM); 
end;
Y=sign(sM);
%plot(s_int,Y,'o')
x0=[];
for z=1:length(Y)
    if Y==0
    x0=[x0,z];
    end
end
Y(x0)=1;
%figure;plot(s_int,Y,'o')
n0=[];

for n=1:length(s_int)-1
    if ~isnan(Y(n+1)+Y(n)) && abs(Y(n+1)-Y(n))>=2
            n0=[n0 n];
    end
end


for n=1:length(n0);
    if abs(sM(n0(n)))>abs(sM(n0(n)+1));
       n0(n)=n0(n)+1;
    end
    
end
n0;
%figure
%plot(s_int,sM,'b-')
%hold on
%plot(s_int(n0),sM(n0),'ro')
%hold off
