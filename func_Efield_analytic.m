function [Erho, Ez] = func_Efield_analytic(rhom, zm)

global L Ca

R1 = sqrt((L-zm).^2+rhom.^2);
R2 = sqrt(zm.^2+rhom.^2);
sinbeta1 = (L-zm)./R1;
sinbeta2 = zm./R2;
cosbeta1 = sqrt(1-sinbeta1.^2);
cosbeta2 = sqrt(1-sinbeta2.^2);
Erho1 = sinbeta1./rhom;
Ez1 = (cosbeta1-1)./rhom;
Erho2 = sinbeta2./rhom;
Ez2 = (cosbeta2-1)./rhom;        

Erho = Ca*(Erho1+Erho2);
Ez = Ca*(Ez1-Ez2);