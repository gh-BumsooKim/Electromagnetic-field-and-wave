clear all, close all, clc

global L Ca Cn

%% Constant
eps0 = 8.854e-12;

%% Inputs
rhoL = 10e-9;
L    = 1.5; % 5
zmax = 1.5;
rhomax = 1;
dz = 0.1;
drho = 0.1;
dzs = 0.02;

%% Calculation
Ca = rhoL/(4*pi*eps0);
Cn = rhoL*dzs/(4*pi*eps0);

%% Analytic Solution
zz = 0:dz:zmax;
rrho = 0.1:drho:rhomax;
Nz = length(zz);
Nrho = length(rrho);

[rhom, zm] = meshgrid(rrho,zz);
[Erho, Ez] = func_Efield_analytic(rhom, zm);

figure(1)
subplot(2,1,1), mesh(rrho,zz,Erho), shading interp, colorbar
subplot(2,1,2), mesh(rrho,zz,Ez), shading interp, colorbar

%% Numerical Solution
zzs = (0:dzs:L-dzs)+dzs/2;
[Erhon, Ezn] = func_Efield_numerical(rrho, zm, zzs);

figure(2)
subplot(2,1,1), mesh(rrho,zz,Erhon), shading interp, colorbar
subplot(2,1,2), mesh(rrho,zz,Ezn), shading interp, colorbar
