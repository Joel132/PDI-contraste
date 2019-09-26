function loe = loe(imagenOriginal, imagenProcesada)

memo = zeros(256, 256) - 1;

[m,n] = size(imagenOriginal);
imagenOriginal=imagenOriginal(1:m,1:n);
imagenProcesada=imagenProcesada(1:m,1:n);
rd=imagenOriginal;
for i=1:m
   for j=1:n
       ni = imagenOriginal(i,j);
       nj = imagenProcesada(i,j);
       if memo(ni + 1, nj + 1) == -1
           uOri = ni>=imagenOriginal;
           uPro = nj>=imagenProcesada;
           XOR=xor(uOri,uPro);
           memo(ni + 1, nj + 1) = sum(XOR(:));
       end
       rd(i,j) = memo(ni + 1, nj + 1);
   end
end

loe=sum(rd(:))/(m*n);