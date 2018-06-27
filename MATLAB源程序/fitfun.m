%ÊÊÓ¦¶Èº¯Êý
function [Fitvalue,cumsump]=fitfun(population)
global popsize
for i=1:popsize
    x1=[transform2to10(population(i,1:4)),transform2to10(population(i,5:8)),transform2to10(population(i,9:12))];
    x2=[transform2to10(population(i,13:16)),transform2to10(population(i,17:20)),transform2to10(population(i,21:24)),transform2to10(population(i,25:28)),transform2to10(population(i,29:32)),transform2to10(population(i,32:36))];
    Fitvalue(i)=targetfun1(x1)+targetfun2(x2)+targetfun3(x1,x2);
end
Pperpopulation=Fitvalue/sum(Fitvalue);
cumsump(1)=Pperpopulation(1);
for i=2:popsize
    cumsump(i)=cumsump(i-1)+Pperpopulation(i);
end
