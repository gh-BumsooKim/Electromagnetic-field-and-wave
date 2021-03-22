clear all, close all, clc

%% Constant
eps0 = 8.854e-12;

%% Inputs
rhoL = 10e-9;
L    = 5;
dz   = 0.1;
drho = 0.02;
zmin = -2.5;
zmax = 2.5;
rhomin = 0.1;
rhomax = 0.5;

%% Calculation
Ca = rhoL/(4*pi*eps0);

%% Analytic Solution
%z = zmin:dz:zmax;
%rho = rhomin:drho:rhomax;
Nz = (zmax-zmin)/dz+1;
Nrho = (rhomax-rhomin)/drho+1;

for ii=1:Nz
    zii = (ii-1)*dz;
    z(ii) = zii;
    for jj=1:Nrho
        rhojj = jj*drho;
        rho(jj) = rhojj;
        
        R1 = sqrt((L-zii)^2+rhojj^2);
        R2 = sqrt(zii^2+rhojj^2);
        sinbeta1 = (L-zii)/R1;
        sinbeta2 = zii/R2;
        cosbeta1 = sqrt(1-sinbeta1^2);
        cosbeta2 = sqrt(1-sinbeta2^2);
        Erho1 = Ca*sinbeta1/rhojj;
        Ez1 = Ca*(cosbeta1-1)/rhojj;
        Erho2 = Ca*sinbeta2/rhojj;
        Ez2 = Ca*(cosbeta2-1)/rhojj;
        
        Erho(ii,jj) = Erho1+Erho2;
        Ez(ii,jj) = Ez1-Ez2;
    end
end

figure(1)
Nzm = 8;
Erhom1 = Erho(Nzm,:);
Ezm1 = Ez(Nzm,:);
subplot(2,1,1), plot(rho,Erhom1,rho,Ezm1)

Nrhom = 10;
Erhom2 = Erho(:,Nrhom);
Ezm2 = Ez(:,Nrhom);
subplot(2,1,2), plot(z,Erhom2,z,Ezm2)

figure(2)
subplot(2,1,1), pcolor(rho,z,Erho), shading interp, colorbar
subplot(2,1,2), pcolor(rho,z,Ez), shading interp, colorbar
%subplot(2,1,1), pcolor(rho,z,Erho), axis equal, shading interp, colorbar
%subplot(2,1,2), pcolor(rho,z,Ez), axis equal, shading interp, colorbar

%% Numerical Solution
