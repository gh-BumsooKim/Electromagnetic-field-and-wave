clear all, close all, clc

V0 = 0.5;
b = 0.5;
M = 11;
xmax = 2;
Ngrid = 20;

%%
mm = 1:2:M;

%% Grid
dy = b/Ngrid;
dx = dy;
x1 = 0:dx:xmax;
y1 = 0:dy:b;

[x,y] = meshgrid(x1,y1);

Vxy = zeros(size(x));
for ii=1:length(mm)
    m = mm(ii); % 1 x 1
    km = m*pi/b; % 1 x 1
    
    am = 4*V0/(m*pi); % 1 x 1
    fx = exp(-km*x); % Grid matrix
    fy = sin(km*y); 
    
    Vxy = Vxy + am*fx.*fy;
end

subplot(2,1,1), pcolor(x,y,Vxy), axis equal
shading interp

subplot(2,1,2), mesh(x,y,Vxy), axis equal
shading interp