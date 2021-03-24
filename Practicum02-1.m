clear all, close all, clc

%% Constant
eps0 = 8.854e-12;

%% Inputs
rhoL = 10e-9;
L    = 5; % 5
zmax = 5;
rhomax = 1;
dz = 0.1;
drho = 0.1;

%% Calculation
Ca = rhoL/(4*pi*eps0);

%% Analytic Solution
zz = 0:dz:zmax;
rrho = 0.1:drho:rhomax;
Nz = length(zz);
Nrho = length(rrho);

[rhom, zm] = meshgrid(rrho,zz);

R1 = sqrt((L-zm).^2+rhom.^2);
R2 = sqrt(zm.^2+rhom.^2);
sinbeta1 = (L-zm)./R1;
sinbeta2 = zm./R2;
cosbeta1 = sqrt(1-sinbeta1.^2);
cosbeta2 = sqrt(1-sinbeta2.^2);
Erho1 = Ca*sinbeta1./rhom;
Ez1 = Ca*(cosbeta1-1)./rhom;
Erho2 = Ca*sinbeta2./rhom;
Ez2 = Ca*(cosbeta2-1)./rhom;        
Erho = Erho1+Erho2;
Ez = Ez1-Ez2;

figure(1)
Nzm = 8;
Erhom1 = Erho(Nzm,:);
Ezm1 = Ez(Nzm,:);
subplot(2,1,1), plot(rrho,Erhom1,rrho,Ezm1)

Nrhom = 10;
Erhom2 = Erho(:,Nrhom);
Ezm2 = Ez(:,Nrhom);
subplot(2,1,2), plot(zz,Erhom2,zz,Ezm2)

figure(2)
subplot(2,1,1), pcolor(rrho,zz,Erho), shading interp, colorbar
subplot(2,1,2), pcolor(rrho,zz,Ez), shading interp, colorbar
