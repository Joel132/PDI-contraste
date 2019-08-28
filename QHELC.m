function QHELC(f,y)

global y;
H=imhist(f);
[M, N]=size(f);
L=0:255;
global p=(H/(M*N));
SP=round(sum(L.*p));
SPL=round(sum(L(1:(SP+1)).*p(1:(SP+1))));
SPU=round(sum(L((SP+2):256).*p((SP+2):256)));
HL1=H(1:(SPL+1));
HL2=H((SPL+2):(SP+1));
HU1=H((SP+2):(SPU+1));
HU2=H((SPU+2):256);
RL1=0:SPl;
RL2=(SPL+1):SP;
RU1=(SP+1):SPU;
RU2=(SPU+1):255;

H(RL1+1)=HiPrima(HL1,RL1);
H(RL2+1)=HiPrima(HL2,RL2);
H(RU1+1)=HiPrima(HU1,RU1);
H(RU2+1)=HiPrima(HU2,RU2);
c=H(2:256)+H(1:255);

