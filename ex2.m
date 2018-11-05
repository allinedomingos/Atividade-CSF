%% Exercicio 2 Aula 4 - 03/08/18
clear all;
close all;
clc;

%% Gerando o sinal s(t)

f1 = 1000;
f2 = 2000;
f3 = 3000;
fa = 100*f3;

t = [0:1/fa:20e-3]; 
s1 = 5*cos(2*pi*f1*t);
s2 = (5/3)*cos(2*pi*f2*t);
s3 = 1*cos(2*pi*f3*t);
s = s1 + s2 + s3;


figure(1)
subplot(411)
plot (t, s1)
title('Domínio do tempo')
subplot(412)
plot (t, s2)
subplot(413)
plot (t, s3)
subplot(414)
plot (t, s)

%% Transformada 
L = length(t)-1;
f = ([-L/2:L/2]/L)*fa;

figure(2)
subplot(411)
Y1 = fft(s1);
Y1 = fftshift(Y1);
plot(f,abs(Y1));
title('Domínio da frequência')
subplot(412)
Y2 = fft(s2);
Y2 = fftshift(Y2);
plot(f,abs(Y2));
subplot(413)
Y3 = fft(s3);
Y3 = fftshift(Y3);
plot(f,abs(Y3));
subplot(414)
Y = fft(s);
Y = fftshift(Y);
plot(f,abs(Y));

%% Filtros

% Passa Baixa
PB = [zeros(1,230) ones(1,40) zeros(1,230)];

SB = Y.*PB;
sb = ifft(ifftshift(SB));
%figure(3)
%plot(f,sb)
%sinal_saida_fpb = fftshift(abs(Y)).*PB;

%plot(f,sinal_saida_fpb)
