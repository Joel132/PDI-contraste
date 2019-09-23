function g=HEM(H, X0, XN)
%Metodo que calcula el HE dado un histograma
%H es el histograma. X0 el menor valor posible para la intensidad. XN el
%mayor valor posible para la intensidad

TOTAL=sum(H);
P=H/TOTAL;
C=P;
for index=2:size(P,2)
    C(index)=C(index-1)+P(index);
end
    
g=round(X0+(XN-X0)*(C-0.5*P));