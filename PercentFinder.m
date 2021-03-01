function [FACT,Diff] = PercentFinder(Fun1,Fun2,Bot,Top);

FactVec=0:.001:1;
l=length(FactVec);

for i=1:l
    Diff(i)=sum((Fun1(Bot:Top)-FactVec(i)*Fun2(Bot:Top)).^2,'omitnan');
end
FACT=FactVec(find(min(Diff)==Diff));