function [ s,r,sM_new,fr ] = FourierTrans_sM( sM,s,d,Display)


smax=max(s);
sl=length(sM)-1;ds=smax/sl;%s(isnan(sM))=[];sM(isnan(sM))=[];%s(s<s0)=min(s(s>s0));
rmax=8;
r=linspace(0,rmax,round(1000));
sM_new=sM.*exp(-d.*s.^2);
for m=1:length(r)
    fr(m)=sum(sM_new.*sin(r(m)*s),'omitnan')*ds; % Calculating fourier transform of theory
end


if strcmp(Display,'on') || strcmp(Display,'On') || strcmp(Display,'ON')
    %figure;plot(s,sM_new);xlabel('s (A^-^1)');title({['damping constant = ' num2str(d)], ['sHole = ' num2str(s0)]});
    figure;plot(r,fr);xlabel('r (A)');title({['damping constant = ' num2str(d)]});
end