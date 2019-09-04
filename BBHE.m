function Y = BBHE(X)

H = imhist(X)';
X = double(X);

Xm = round(mean(X(:)));
HL = H(1:(Xm + 1));
HU = H((Xm + 2):256);

nL = sum(HL);
pL = HL / nL;

nU = sum(HU);
pU = HU / nU;

cL = pL;
for i = 2:(Xm + 1)
    cL(i) = cL(i) + cL(i - 1);
end

cU = pU;
for i = 2:(255 - Xm)
    cU(i) = cU(i) + cU(i - 1);
end

c = [cL, cU];

cond = ((0:255) <= Xm);
f = cond .* (Xm * c) + ~cond .* ((Xm + 1) + (255 - (Xm + 1)) * c);

Y = f(X + 1);
Y = uint8(Y);
