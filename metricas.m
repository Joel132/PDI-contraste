m1=imread('01.png');
m2=imread('02.png');
m3=imread('03.png');
m4=imread('04.png');
m5=imread('05.png');
%m1=m5;
matrix=zeros(7,6);
[entropia,cont]=metricas_original(m1);
matrix(1,4:5)=[entropia,cont];
[t, ambe, psn, ent, cont,  loeC]=metricas_HE(m1);
matrix(2,:)=[t, ambe, psn, ent, cont, loeC];
[t, ambe, psn, ent, cont,  loeC]=metricas_HE(m1);
matrix(2,:)=[t, ambe, psn, ent, cont,  loeC];
[t, ambe, psn, ent, cont,  loeC]=metricas_BBHE(m1);
matrix(3,:)=[t, ambe, psn, ent, cont, loeC];
[t, ambe, psn, ent, cont,  loeC]=metricas_QHELC(m1,0);
matrix(4,:)=[t, ambe, psn, ent, cont,  loeC];
[t, ambe, psn, ent, cont,  loeC]=metricas_QHELC(m1,0.003);
matrix(5,:)=[t, ambe, psn, ent, cont,  loeC];
[t, ambe, psn, ent, cont,  loeC]=metricas_QHELC(m1,0.055);
matrix(6,:)=[t, ambe, psn, ent, cont,  loeC];
[t, ambe, psn, ent, cont,  loeC]=metricas_QHELC(m1,1);
matrix(7,:)=[t, ambe, psn, ent, cont,  loeC];
function [entropia,cont] = metricas_original(imagen)
%RECIBI UNA IMAGEN Y DEVUELVE LAS METRICAS DE ENTROPIA Y CONTRASTE
%   La imagen que recibe debe ser en escala de grises.

entropia = entropy(imagen);
cont = contraste(imagen);
end

function [t, ambe, psn, ent, cont,  loeC] = metricas_HE(imagenOriginal)
%DEVUELVE LAS METRICAS DE T, AMBE, PSNR, ENTROPIA, CONTRASTE, CIR Y LOE PARA EL METODO HE.
%SE DEBE PASAR COMO ARGUMENTOS LA IMAGEN ORIGINAL

tic
imagenProcesada=HE(imagenOriginal);
t=toc;
[ambe, psn, ent, cont,  loeC]=metricas_comunes(imagenOriginal,imagenProcesada);
end

function [t, ambe, psn, ent, cont, loeC] = metricas_BBHE(imagenOriginal)
%DEVUELVE LAS METRICAS DE T, AMBE, PSNR, ENTROPIA, CONTRASTE, CIR Y LOE PARA EL METODO BBHE.
%SE DEBE PASAR COMO ARGUMENTOS LA IMAGEN ORIGINAL

tic
imagenProcesada=BBHE(imagenOriginal);
t=toc;
[ambe, psn, ent, cont,  loeC]=metricas_comunes(imagenOriginal,imagenProcesada);
end

function [t, ambe, psn, ent, cont, loeC] = metricas_QHELC(imagenOriginal,alpha)
%DEVUELVE LAS METRICAS DE T, AMBE, PSNR, ENTROPIA, CONTRASTE, CIR Y LOE PARA EL METODO QHELC.
%SE DEBE PASAR COMO ARGUMENTOS LA IMAGEN ORIGINAL Y EL PARAMTRO DE
%MEJORAMIENTO ALFA

tic
imagenProcesada=QHELC(imagenOriginal,alpha);
t=toc;
[ambe, psn, ent, cont,  loeC]=metricas_comunes(imagenOriginal,imagenProcesada);
end

function [ambe, psn, ent, cont,  loeC]=metricas_comunes(imagenOriginal,imagenProcesada)
ambe=AMBE(imagenOriginal, imagenProcesada);
psn=psnr(imagenProcesada,imagenOriginal);
ent=entropy(imagenProcesada);
cont=contraste(imagenProcesada);
loeC=loe(imagenOriginal, imagenProcesada);
end