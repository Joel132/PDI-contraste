function m1 = QHELC(m,y)
%Metodo que aplica QHELC a una imagen
%m es una matriz en escala de grises. y es el parametro de mejoramiento de
%constraste, varia de 0 a 1.

global y1;
y1=y;
H=imhist(m);
H=H.';
[M, N]=size(m);
L=0:255;
p=(H/(M*N));
SP=round(sum(L.*p));%EL BRILLO PROMEDIO

p=H(1:(SP+1));
p=p/sum(p);
SPL=round(sum(L(1:(SP+1)).*p));

p=H((SP+2):256);
p=p/sum(p);
SPU=round(sum(L((SP+2):256).*p));

RL1=0:SPL;
RL2=(SPL+1):SP;
RU1=(SP+1):SPU;
RU2=(SPU+1):255;

HL1=H(RL1+1);
HL2=H(RL2+1);
HU1=H(RU1+1);
HU2=H(RU2+1);

f=H;
f(RL1+1)=HiPrima(HL1,RL1);
f(RL2+1)=HiPrima(HL2,RL2);
f(RU1+1)=HiPrima(HU1,RU1);
f(RU2+1)=HiPrima(HU2,RU2);

m1=uint8(f(double(m)+1));
% m1=f;
% for r=1:M
%     for c=1:N
%         m1(r,c)=f(m(r,c)+1);
%     end
% end

%imshow(m), figure, imshow(m1)



