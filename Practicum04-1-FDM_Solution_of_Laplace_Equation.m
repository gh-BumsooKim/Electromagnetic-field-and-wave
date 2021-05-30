clear all, close all, clc
%% FDM Solution of Laplace Euqation

V0 = 1;
aa = 10;
bb = 5;
dx = 1;
 
Ngx = round(aa/dx)-1;
Ngy = round(bb/dx)-1;
%%
msize = Ngx*Ngy;

%% A matrix
A = zeros(msize, msize);

for ii=1:msize
    A(ii,ii) = 4;
    
    column = fix((ii-1)/9);
    row = rem(ii,9);
    if (column==1 || column==2) && (2<=row && row<=8)
        A(ii,[ii-9 ii-1 ii+1 ii+9]) = -1;
    end
    
    if 2<=row && row<=8
        % V1 ~ V8
        if column==0
            A(ii, [ii-1 ii+1 ii+9]) = -1;
        end
        % V29 ~ V35
        if column==3
            A(ii, [ii-1 ii+1 ii-9]) = -1;
        end
    end
    
    if 1<=column && column<=2
        % V10 V19
        if row==1
            A(ii, [ii-9 ii+1 ii+9]) = -1;
        end
        % V18 V 27
        if row==0
            A(ii, [ii-9 ii-1 ii+9]) = -1;
        end
    end
end

A(1, [2 10]) = -1;
A(9, [8, 18]) = -1;
A(28, [19, 29]) = -1;
A(36, [27, 35]) = -1;
%% B matrix

b = zeros(msize,1);
b([1 10 19 28]) = V0;

Vxy = inv(A)*b;

VVxy = (reshape(Vxy, 9, 4)).';

VVVxy = zeros(6,11);
VVVxy(:,1) = V0;
VVVxy(1,1) = V0/2;
VVVxy(6,1) = V0/2;
VVVxy(2:5, 2:10) = VVxy;

x1 = 0:dx:aa;
y1 = 0:dx:bb;
[x, y] = meshgrid(x1,y1);

subplot(2,1,1), pcolor(x,y,VVVxy), axis equal
shading interp

subplot(2,1,2), mesh(x,y,VVVxy), axis equal
shading interp
