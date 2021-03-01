function [dsMf] = ApplyFilter(dsM,display);

s=(0:449)*0.0121;
Order=10;
dsMOld=dsM;
gdly=round(Order/2);
dsMf=zeros(size(dsM));
Hd = designfilt('lowpassfir','FilterOrder',Order,'CutoffFrequency',0.001,'DesignMethod','window','Window',{@chebwin,100},'SampleRate',1);
y = filter(Hd,dsM);
dsMf(1:end-gdly)=y(gdly+1:end);
dsMf(end-gdly+1:end)=dsM(end-gdly+1:end);

if strcmpi(display,'on')
figure;plot(s,dsMOld,s,dsMf)
end