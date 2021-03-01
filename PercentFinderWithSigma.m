function [FACT,Chi2,RedChi2,Diff] = PercentFinderWithSigma(Fun1,Fun2,Bot,Top,Sigma);

FactVec=0:.01:1;
l=length(FactVec);

for i=1:l
    OE2=(Fun1(Bot:Top)-FactVec(i)*Fun2(Bot:Top)).^2;
    Sig2=Sigma(Bot:Top).^2;
    Diff(i)=sum(OE2./Sig2,'omitnan');
end
FACT=FactVec(find(min(Diff)==Diff));
Chi2=Diff(find(min(Diff)==Diff));
RedChi2=1/abs(Top-Bot)*Chi2;