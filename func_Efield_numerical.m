function [Erhon, Ezn] = func_Efield_numerical(rhom, zm, zzs)

global Cn

Nzs = length(zzs);
Erhon = 0;
Ezn = 0;

for ii = 1:Nzs % Rv/R^3
    zs = zzs(ii);
    R3 = (rhom.^2+(zm-zs).^2).^(3/2);
    fRrho = rhom./R3;
    fRz = (zm-zs)./R3;
    
    Erhon = Erhon+Cn*fRrho;
    Ezn = Ezn+Cn*fRz;
end