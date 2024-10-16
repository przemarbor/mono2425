% higiena
clear all
close all
clc

% PREPROCESSING

%%% Deklaracja/inicjalizacja zmiennych

%% Geometria
aa = 0 ;
bb = 1 ;

n = 5 ; % liczba wezlow siatki
x = linspace(aa,bb,n) ;
dx = x(2) - x(1) ;
h = dx ;

%% Warunki brzegowe
wbLt = 'D' ;
wbRt = 'D' ;

wbLw = 30 ;
wbRw = 15 ;

% inicjalizacja zmiennych potrzebnych w trakcie obliczen
A = zeros(n, n) ;
b = zeros(n, 1) ;

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
  TODO
else
  error('Bledny typ war. brzeg.')
end

if wbRt == 'D'
  A(n,n) = 1 ;
  b(n)   = wbRw ;
elseif wbRt == 'N'
  TODO
else
  error('Bledny typ war. brzeg.')
end

T = A\b

% POSTPROCESSING

figure, plot(x, T, 'ro')
hold on
plot(x, 30 - 15*x, 'b')
hold off


