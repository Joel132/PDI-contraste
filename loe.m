function loe = loe(imagenOriginal, imagenProcesada)

[m,n] = size(imagenOriginal);
imagenOriginal=imagenOriginal(1:m,1:n);
imagenProcesada=imagenProcesada(1:m,1:n);
rd=imagenOriginal;
for i=1:m
   for j=1:n
       uOri = imagenOriginal(i,j)>=imagenOriginal;
       uPro = imagenProcesada(i,j)>=imagenProcesada;
       XOR=xor(uOri,uPro);
       rd(i,j)=sum(XOR(:));
   end
end

loe=sum(rd(:))/(m*n);