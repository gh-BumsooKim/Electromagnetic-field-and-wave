clear all
close all
clc

ke = 8.9877e9;
qs1 = 10e-9;
qs2 = 5e-9;

rs1 = [1 0 2];
rs2 = [-2 0 3];
r = [1 3 2];

R1 = r-rs1;
R2 = r-rs2;

R1abs = norm(R1);
R2abs = norm(R2);

hatR1 = R1/R1abs;
hatR2 = R2/R2abs;

E1 = hatR1*ke*qs1*1/R1abs^2;
E2 = hatR2*ke*qs2*1/R2abs^2;
E = E1+E2;

norm(E)
