clear all
close all
clc

x = 0.1:0.1:2;
z = -2.5:0.1:2.5;

[X, Z] = meshgrid(x,z);

rho_L = 10;
E = (rho_L/30)/(4*pi*eps)*(X./X.^2);

mesh(X,E,Z);
