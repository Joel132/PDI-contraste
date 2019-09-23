function f = HiPrima(hi,ri)
%Metodo auxiliar de QHELC que calcula la ecualizacion para un subhistograma
%hi es el subhistograma. ri es el intervalo de las intensidades que se
%incluye en el histograma

global y1;
Ni=sum(hi);%CANTIDAD TOTAL DE PIXELES EN EL SUBHISTOGRAMA
Ii=size(ri,2);%EL TAMANO DEL INTERVALO DEL SUBHISTOGRAMA
CLi=ceil(Ni/Ii)+round(y1*(Ni-(Ni/Ii)));%EL LIMITE DE CORTE
Ti=sum(max(hi-CLi,0));%SUMA TOTAL DE PIXELES QUE SE PIERDE AL CORTAR EN CLi
AIi=floor(Ti/Ii);%CANTIDAD A DISTRIBUIR A CADA PIXEL
cond=hi>(CLi-AIi);
hip=CLi .* cond + (hi + AIi) .* (1 - cond);
f=HEM(hip,ri(1),ri(Ii));
