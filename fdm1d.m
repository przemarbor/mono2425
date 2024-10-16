% higiena
clear all
close all
clc

% PREPROCESSING

%%% Deklaracja/inicjalizacja zmiennych

%% Geometria
aa = 0 ;
bb = 1 ;

n = 11 ; % liczba wezlow siatki
x = linspace(aa,bb,n) ;
dx = x(2) - x(1) ;
h = dx ;

f_fh = @(x) 1*ones(size(x)) ;

%% Warunki brzegowe
wbLt = 'N' ;
wbRt = 'D' ;

wbLw =  1 ;
wbRw =  2 ;

% inicjalizacja zmiennych potrzebnych w trakcie obliczen
A = zeros(n, n) ;
b = zeros(n, 1) ;
b = f_fh( x(:) ) ;

% PROCESSING

% assembling

for ii=2:n-1
  A(ii,ii)   =  2/h^2 ;
  A(ii,ii-1) = -1/h^2 ;
  A(ii,ii+1) = -1/h^2 ;
end

% uwzglednienie war. brzeg.
if wbLt == 'D'
  A(1,1) = 1 ;
  b(1)   = wbLw ;
elseif wbLt == 'N'
  A(1,1)   =  2/h^2 ;
  A(1,2)   = -2/h^2 ;
  b(n)     = wbLw * 2* h/ h^2 ;
else
  error('Bledny typ war. brzeg.')
end

if wbRt == 'D'
  A(n,n) = 1 ;
  b(n)   = wbRw ;
elseif wbRt == 'N'
  A(n,n)   = 2/h^2 ;
  A(n,n-1) = -2/h^2 ;
  b(n)     = wbRw * 2* h/ h^2 ;
else
  error('Bledny typ war. brzeg.')
end

T = A\b ;

% POSTPROCESSING

figure, plot(x, T, 'ro')
hold on
% plot(x, 30 - 15*x, 'b')
% plot(x, 100 - 300*x, 'b')
% plot(x, -0.5 * x.^2 + 0.5 * x, 'b')
hold off

% sprawdzenie spelnienia warunkow brzeg.

if (wbRt == 'D')
  disp(['Rozw. przyblizone ' num2str(T(end)) ])
elseif (wbRt == 'N')
  disp(['Rozw. przyblizone ' num2str( (T(end) - T(end-1))/h  ) ])
else
  error('Zly typ WB')
end

if (wbLt == 'D')
  disp(['Rozw. przyblizone ' num2str(T(1)) ])
elseif (wbLt == 'N')
  disp(['Rozw. przyblizone ' num2str( -(T(2) - T(1))/h  ) ])
else
  error('Zly typ WB')
end

