function m1=HE(m)
%Metodo que calcula HE de una imagen en escala de grises.
%m la matriz en escala de grises

H=imhist(m);
H=H.';
[M, N]=size(m);
f=HEM(H,0,255);
m1=m;
for r=1:M
    for c=1:N
        m1(r,c)=f(m(r,c)+1);
    end
end
imshow(m), figure, imshow(m1)