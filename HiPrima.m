function hip = HiPrima(hi,ri)

Ni=sum(hi);
Ii=size(ri);
CLi=ceil(Ni/Ii)+round(y*(Ni-(Ni/Ii)));
Ti=sum(max(hi-CLi,0));
AIi=floor(Ti/Ii);
cond=hi>(CLi-AIi);
hip=CLi .* cond + (hi + AIi) .* (1 - cond);
