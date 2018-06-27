%遗传算法求解最优补贴方案
clear all
clc
close all
global popsize;
popsize=50;
pcrossover=0.8;
pmutation=0.01;
generationmax=50;
blength=36;
population=round(rand(popsize,blength));
[fit,cum]=fitfun(population);
for i=1:generationmax
    for j=1:2:popsize
        seln=gaselect(population,cum);
        scro=gacrossover(population,seln,pcrossover);
        scnew(j,:)=scro(1,:);
        scnew(j+1,:)=scro(2,:);
        smnew(j,:)=mutation(scnew(j,:),pmutation);
        smnew(j+1,:)=mutation(scnew(j+1,:),pmutation);
    end
    population=smnew;
    [fit,cum]=fitfun(population);
    [fmax,nmax]=max(fit);
    fmean=mean(fit);
    ymax(i)=fmax;
    ymean(i)=fmean;
    greatpop(i,:)=population(nmax,:);
end
